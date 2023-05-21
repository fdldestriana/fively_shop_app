import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fively/core.dart';

class RePasswordField extends StatefulWidget {
  const RePasswordField({super.key});

  @override
  State<RePasswordField> createState() => _RePasswordFieldState();
}

class _RePasswordFieldState extends State<RePasswordField> {
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Password can not be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      decoration: BoxDecoration(
          color: ColorLib.white, borderRadius: BorderRadius.circular(4)),
      child: TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: Get.width * 0.05),
          labelText: 'Password',
          labelStyle:
              GoogleFonts.montserrat(color: ColorLib.gray, fontSize: 14),
          suffixIcon: _passwordController.text.isNotEmpty
              ? Icon(
                  Icons.check,
                  color: ColorLib.success,
                )
              : null,
        ),
        validator: passwordValidator,
        obscureText: true,
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
