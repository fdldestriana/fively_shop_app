import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupController extends State<SignupView> implements MvcController {
  static late SignupController instance;
  late SignupView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final signUpKey = GlobalKey<FormState>();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<UserCredential?> signInWithEmail(
  //     {required String email, required String password}) async {
  //   UserCredential? userCred;
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   try {
  //     userCred = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       throw Failure(message: e.message as String);
  //     } else if (e.code == 'wrong-password') {
  //       throw Failure(message: e.message as String);
  //     } else if (e.code == 'invalid-email') {
  //       throw Failure(message: e.message as String);
  //     }
  //   } catch (e) {
  //     throw Failure(message: 'There is exception occured');
  //   }
  //   return userCred;
  // }

  Future<void> signUpUser(
      {required String name,
      required String email,
      required String password}) async {
    FirebaseAuth fireAuth = FirebaseAuth.instance;
    FirebaseFirestore fireFirestore = FirebaseFirestore.instance;
    // FirebaseStorage fireStorage = FirebaseStorage.instance;
    UserCredential userCred;

    try {
      userCred = await fireAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      // final upload =
      //     await fireStorage.ref('photos/$fileName').putFile(file as File);
      // final photoProfile = await upload.ref.getDownloadURL();

      fireFirestore.collection('users').doc(userCred.user!.uid).set(
        {
          'uid': userCred.user!.uid,
          'firstName': name.split(' ')[0],
          'lastName': name.split(' ')[1],
          'email': email,
          // 'photoProfile': photoProfile
        },
      );

      debugPrint('success sign up');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Failure(message: e.message as String);
      }
      if (e.code == 'invalid-email') {
        throw Failure(message: e.message as String);
      }
      if (e.code == 'operation-not-allowed') {
        throw Failure(message: e.message as String);
      }
      if (e.code == 'weak-password') {
        throw Failure(message: e.message as String);
      }
    }
  }
}
