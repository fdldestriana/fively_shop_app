import 'package:flutter/material.dart';
import 'package:fively/core.dart';

class ForgotPasswordController extends State<ForgotPasswordView>
    implements MvcController {
  static late ForgotPasswordController instance;
  late ForgotPasswordView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final forgotPasswordKey = GlobalKey<FormState>();
}
