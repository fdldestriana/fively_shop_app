import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingItem extends StatefulWidget {
  const ShippingItem(
      {super.key,
      required this.shipping,
      required this.shippingCost,
      required this.shippingEstimated});
  final String shipping;
  final String shippingCost;
  final String shippingEstimated;

  @override
  State<ShippingItem> createState() => _ShippingItemState();
}

class _ShippingItemState extends State<ShippingItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(
        () {
          isSelected = !isSelected;
        },
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: ColorLib.white),
        width: Get.width * 0.92,
        height: Get.height * 0.09,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.shipping,
                  style: GoogleFonts.roboto(
                      color: ColorLib.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.shippingEstimated,
                  style: GoogleFonts.roboto(
                      color: ColorLib.gray,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  widget.shippingCost,
                  style: GoogleFonts.roboto(
                      color: ColorLib.gray,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 10),
                isSelected
                    ? const Icon(Icons.radio_button_checked)
                    : const Icon(Icons.radio_button_off)
              ],
            )
          ],
        ),
      ),
    );
  }
}
