import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fively/core.dart';

class AuthService {
  static get isAuthenticated {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<UserCredential?> signInWithEmail(
      {required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential? userCred;

    try {
      userCred = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Failure(message: e.message as String);
      } else if (e.code == 'wrong-password') {
        throw Failure(message: e.message as String);
      } else if (e.code == 'invalid-email') {
        throw Failure(message: e.message as String);
      }
    } catch (e) {
      throw Failure(message: e.toString());
    }
    return userCred;
  }

  static Future<UserCredential?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required File file,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseStorage storage = FirebaseStorage.instance;
    UserCredential? userCred;

    try {
      userCred = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final upload = await storage.ref('photos/$name').putFile(file);
      final photoProfile = await upload.ref.getDownloadURL();
      await firestore.collection('users').doc(userCred.user!.uid).set(
        {
          'uid': userCred.user!.uid,
          'firstName': name.split(' ')[0],
          'lastName': (name.split(' ').length > 1)
              ? name.split(' ')[1]
              : name.split(' ')[0],
          'email': email,
          'photoProfile': photoProfile
        },
      );
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
    } catch (e) {
      throw Failure(message: e.toString());
    }
    return userCred;
  }
}
