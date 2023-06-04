import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {super.key,
      required this.menu,
      required this.subMenu,
      required this.onTap});
  final String menu;
  final String subMenu;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.09,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: menu,
                style: GoogleFonts.montserrat(
                    color: ColorLib.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: subMenu,
                    style: GoogleFonts.montserrat(
                        color: ColorLib.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: Get.width * 0.04,
              color: ColorLib.gray,
            )
          ],
        ),
      ),
    );
  }
}
