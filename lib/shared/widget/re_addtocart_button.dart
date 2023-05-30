import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class ReAddToCartButton extends StatelessWidget {
  const ReAddToCartButton({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.10,
        height: Get.height * 0.04,
        decoration:
            BoxDecoration(color: ColorLib.primary, shape: BoxShape.circle),
        child: Icon(
          Icons.shopping_bag,
          color: ColorLib.white,
        ),
      ),
    );
  }
}
