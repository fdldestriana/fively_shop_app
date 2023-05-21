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
                    child: RePhotoPicker(() {}
                        // () async {
                        //   try {
                        //     FilePickerResult? filePickerResult =
                        //         await FilePicker.platform.pickFiles(
                        //       allowMultiple: false,
                        //       allowedExtensions: ['png', 'jpg'],
                        //       type: FileType.custom,
                        //     );
                        //     controller.file = File(
                        //         filePickerResult?.files.single.path as String);
                        //     controller.fileName =
                        //         filePickerResult?.files.single.name;
                        //   } on Exception catch (e) {
                        //     showErrorDialog(context, e.toString());
                        //   }
                        // },
                        ),
                  ),
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  const ReNameField(),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const ReEmailField(),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const RePasswordField(),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.37),
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
                  ReButton(
                      child: Text(
                        'SIGN UP',
                        style: GoogleFonts.montserrat(
                            color: ColorLib.white, fontSize: 14),
                      ),
                      onPressed: () async {
                        if (controller.signUpKey.currentState!.validate()) {}
                      }),
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
                            onPressed: () async {
                              await controller.signInWithGoogle();
                            },
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
