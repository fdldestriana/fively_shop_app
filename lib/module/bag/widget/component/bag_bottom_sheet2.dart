import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BagBottomSheet2 extends StatelessWidget {
  BagBottomSheet2({super.key});

  final List<String> shipping = [
    "Free Shipping",
    "Standard Shipping",
    "Express Shipping"
  ];

  final List<String> shippingCost = ["Free", "\$4.74", "\$31.58"];

  final List<String> shippingEstimated = [
    "1 month - Tuesday, 27 June 2023",
    "2 weeks - Saturday, 10 June 2023",
    "3-4 days - Thursday, 1 June 2023"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      color: ColorLib.background,
      height: Get.height * 0.35,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: shipping.length,
            itemBuilder: (context, index) => ShippingItem(
              shipping: shipping[index],
              shippingCost: shippingCost[index],
              shippingEstimated: shippingEstimated[index],
            ),
          ),
          SizedBox(height: Get.height * 0.01),
          ReButton(
            onPressed: () {},
            width: double.infinity,
            height: Get.height * 0.05,
            child: Text(
              "PROCEED TO CHECKOUT",
              style: GoogleFonts.montserrat(
                  color: ColorLib.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
