import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fively/core.dart';

class ReEmailField extends StatelessWidget {
  const ReEmailField(this.controller, {super.key});

  final TextEditingController controller;
  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Email can not be empty';
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
          labelText: 'Email',
          labelStyle:
              GoogleFonts.montserrat(color: ColorLib.gray, fontSize: 14),
          suffixIcon: controller.text.isNotEmpty
              ? Icon(
                  Icons.check,
                  color: ColorLib.success,
                )
              : null,
        ),
        validator: emailValidator,
        onChanged: (value) {},
      ),
    );
  }
}
