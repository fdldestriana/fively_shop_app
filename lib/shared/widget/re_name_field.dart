import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReNameField extends StatelessWidget {
  const ReNameField(this.controller, {super.key});

  final TextEditingController controller;
  String? nameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Name can not be empty';
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
          labelText: 'Name',
          labelStyle:
              GoogleFonts.montserrat(color: ColorLib.gray, fontSize: 14),
          suffixIcon: controller.text.isNotEmpty
              ? Icon(
                  Icons.check,
                  color: ColorLib.success,
                )
              : null,
        ),
        validator: nameValidator,
        onChanged: (value) {},
      ),
    );
  }
}
