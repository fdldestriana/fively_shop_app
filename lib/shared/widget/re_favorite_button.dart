import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class ReFavoriteButton extends StatelessWidget {
  const ReFavoriteButton(
      {super.key, this.icon, this.color, required this.onTap});

  final IconData? icon;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.10,
        height: Get.height * 0.04,
        decoration:
            BoxDecoration(color: ColorLib.white, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
