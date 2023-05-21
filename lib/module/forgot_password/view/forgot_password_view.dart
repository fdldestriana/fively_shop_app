import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  Widget build(context, ForgotPasswordController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorLib.background,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.forgotPasswordKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Forgot password',
                    style: GoogleFonts.montserrat(
                        color: ColorLib.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: Get.height * 0.11,
                  ),
                  Text(
                    'Please, enter your email address. You will receive\na link to create a new password via email.',
                    style: GoogleFonts.montserrat(
                        color: ColorLib.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const ReEmailField(),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  ReButton(
                    child: Text(
                      'SEND',
                      style: GoogleFonts.montserrat(
                          color: ColorLib.white, fontSize: 14),
                    ),
                    onPressed: () async {
                      controller.forgotPasswordKey.currentState!.validate();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<ForgotPasswordView> createState() => ForgotPasswordController();
}
