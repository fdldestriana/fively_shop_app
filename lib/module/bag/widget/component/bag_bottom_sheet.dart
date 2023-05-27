import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BagBottomSheet extends StatelessWidget {
  const BagBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Get.width * 0.04),
      height: Get.height * 0.22,
      width: double.infinity,
      color: ColorLib.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width * 0.91,
            height: Get.height * 0.04,
            decoration: BoxDecoration(
                color: ColorLib.white,
                borderRadius: BorderRadius.circular(Get.width * 0.02)),
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: GoogleFonts.montserrat(color: ColorLib.gray),
                hintText: 'Enter your promo code',
                suffixIconColor: ColorLib.black,
                suffixIcon: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: ColorLib.black,
                    shape: const CircleBorder(),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: ColorLib.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
            child: Text(
              'Total amount:',
              style: GoogleFonts.montserrat(color: ColorLib.gray, fontSize: 14),
            ),
          ),
          ReButton(
            onPressed: () {},
            height: Get.height * 0.06,
            width: Get.width * 0.91,
            child: Text(
              'CHECK OUT',
              style:
                  GoogleFonts.montserrat(color: ColorLib.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
