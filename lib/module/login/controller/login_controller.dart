import 'package:flutter/material.dart';
import 'package:fively/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final loginKey = GlobalKey<FormState>();

  // Future<UserCredential?> signInWithEmail() async {
  //   UserCredential? userCred;
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   try {
  //     userCred = await auth.signInWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //     emailController.clear();
  //     passwordController.clear();
  //     Get.to(const RootView());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       throw Failure(message: e.message as String);
  //     } else if (e.code == 'wrong-password') {
  //       throw Failure(message: e.message as String);
  //     } else if (e.code == 'invalid-email') {
  //       throw Failure(message: e.message as String);
  //     }
  //   } catch (e) {
  //     throw Failure(message: e.toString());
  //   }
  //   return userCred;
  // }

  AuthState _authState = AuthState.notSignedIn;
  AuthState get authState => _authState;
  void setAuth(AuthState state) {
    _authState = state;
    setState(() {});
  }

  Future<void> signInWithEmail() async {
    setAuth(AuthState.loading);
    try {
      await AuthService.signInWithEmail(
          email: emailController.text, password: passwordController.text);
      emailController.clear();
      passwordController.clear();
      setAuth(AuthState.signedIn);
      Get.to(const RootView());
    } on Failure catch (e) {
      setAuth(AuthState.notSignedIn);
      throw Failure(message: e.toString());
    }
  }
}
