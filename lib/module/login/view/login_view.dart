import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
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
            key: controller.loginKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                        color: ColorLib.black,
                        fontSize: 34,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: Get.height * 0.09,
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
                    padding: EdgeInsets.only(left: Get.width * 0.42),
                    child: TextButton(
                      onPressed: () => Get.to(const ForgotPasswordView()),
                      child: Row(
                        children: [
                          Text(
                            'Forgot your password?',
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
                    height: Get.height * 0.03,
                  ),
                  ReButton(
                      child: Text(
                        'LOGIN',
                        style: GoogleFonts.montserrat(
                            color: ColorLib.white, fontSize: 14),
                      ),
                      onPressed: () async {
                        if (controller.loginKey.currentState!.validate()) {
                          try {
                            await controller.signInWithEmail();
                          } on Failure catch (failure) {
                            showErrorDialog(context, failure.message);
                          }
                        }
                      }),
                  SizedBox(
                    height: Get.height * 0.10,
                  ),
                  Center(
                    child: Text(
                      'Or login with social account',
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
  State<LoginView> createState() => LoginController();
}
