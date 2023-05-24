import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/banner.jpeg',
          width: double.infinity,
          height: Get.height * 0.24,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: Get.width * 0.04,
          bottom: Get.height * 0.03,
          child: Text(
            'Urban sneakers',
            style: GoogleFonts.montserrat(
                color: ColorLib.white,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
