import 'dart:io';
import 'package:file_picker/file_picker.dart';
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
    try {
      await AuthService.signUpWithEmail(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          file: file as File);
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      file = null;
      setAuth(AuthState.signedUp);
      Get.to(const LoginView());
    } on Failure catch (e) {
      setAuth(AuthState.notSignedUp);
      throw Failure(message: e.toString());
    }
  }
}
