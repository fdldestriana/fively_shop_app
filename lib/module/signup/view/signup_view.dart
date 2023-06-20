import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  Widget build(context, SignupController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.signUpKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Sign up',
                    style: GoogleFonts.montserrat(
                        color: ColorLib.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Center(
                    child: RePhotoPicker(
                      file: controller.file,
                      onTap: () => controller.photoPicker(),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  ReNameField(controller.nameController),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  ReEmailField(controller.emailController),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  RePasswordField(controller.passwordController),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.30),
                    child: TextButton(
                      onPressed: () => Get.to(const LoginView()),
                      child: Row(
                        children: [
                          Text(
                            'Already have an account?',
                            style: GoogleFonts.montserrat(
                                color: ColorLib.black, fontSize: 14),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.arrow_forward,
                              color: ColorLib.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  if (controller.authState == AuthState.notSignedUp) ...[
                    ReButton(
                        height: Get.height * 0.06,
                        width: double.infinity,
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.montserrat(
                              color: ColorLib.white, fontSize: 14),
                        ),
                        onPressed: () async {
                          if (controller.signUpKey.currentState!.validate()) {
                            try {
                              await controller.signUpWithEmail();
                            } on Failure catch (failure) {
                              showErrorDialog(context, failure.toString());
                            }
                          }
                        })
                  ] else if (controller.authState == AuthState.loading) ...[
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Signing up ....',
                            style:
                                GoogleFonts.montserrat(color: ColorLib.black),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          CircularProgressIndicator(
                            color: ColorLib.primary,
                          )
                        ],
                      ),
                    )
                  ] else if (controller.authState == AuthState.signedUp) ...[
                    Center(
                      child: Column(
                        children: [
                          Text('Sign Up success !!!',
                              style: GoogleFonts.montserrat(
                                  color: ColorLib.black)),
                          Icon(
                            Icons.check,
                            size: 36,
                            color: ColorLib.success,
                          )
                        ],
                      ),
                    )
                  ],
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Center(
                    child: Text(
                      'Or sign up with social account',
                      style: GoogleFonts.montserrat(
                          color: ColorLib.black, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/buttons/social_media_buttons/google.png')),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                'assets/buttons/social_media_buttons/facebook.png')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<SignupView> createState() => SignupController();
}
