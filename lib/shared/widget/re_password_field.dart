import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fively/core.dart';

class RePasswordField extends StatelessWidget {
  const RePasswordField(this.controller, {super.key});
  final TextEditingController controller;

  String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Password can not be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
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
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: Get.width * 0.05),
          labelText: 'Password',
          labelStyle:
              GoogleFonts.montserrat(color: ColorLib.gray, fontSize: 14),
          suffixIcon: controller.text.isNotEmpty
              ? Icon(
                  Icons.check,
                  color: ColorLib.success,
                )
              : null,
        ),
        validator: passwordValidator,
        obscureText: true,
        onChanged: (value) {},
      ),
    );
  }
}
