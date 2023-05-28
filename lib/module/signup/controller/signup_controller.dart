import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class SignupController extends State<SignupView> implements MvcController {
  static late SignupController instance;
  late SignupView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final signUpKey = GlobalKey<FormState>();

  File? file;
  Future<void> photoPicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ['png', 'jpg'],
        type: FileType.custom,
      );
      file = result != null ? File(result.files.single.path as String) : null;
      setState(() {});
    } on Exception catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  AuthState _authState = AuthState.notSignedUp;
  AuthState get authState => _authState;
  void setAuth(AuthState state) {
    _authState = state;
    setState(() {});
  }

  Future<void> signUpWithEmail() async {
    setAuth(AuthState.loading);
    FirebaseAuth fireAuth = FirebaseAuth.instance;
    FirebaseFirestore fireFirestore = FirebaseFirestore.instance;
    FirebaseStorage fireStorage = FirebaseStorage.instance;
    UserCredential userCred;

    try {
      userCred = await fireAuth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      final upload = await fireStorage
          .ref('photos/${nameController.text}')
          .putFile(file as File);
      final photoProfile = await upload.ref.getDownloadURL();

      await fireFirestore.collection('users').doc(userCred.user!.uid).set(
        {
          'uid': userCred.user!.uid,
          'firstName': nameController.text.split(' ')[0],
          'lastName': nameController.text.split(' ')[1],
          'email': emailController.text,
          'photoProfile': photoProfile
        },
      );

      debugPrint('success sign up');
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      file = null;
      setAuth(AuthState.signedUp);
      setState(() {});
    } on FirebaseAuthException catch (e) {
      setAuth(AuthState.notSignedUp);
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
    } catch (e) {
      setAuth(AuthState.notSignedUp);
      throw Failure(message: e.toString());
    }
  }
}

enum AuthState { notSignedUp, loading, signedUp }
