import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class ReFavoriteButton extends StatelessWidget {
  const ReFavoriteButton({
    super.key,
    this.icon,
    this.color,
  });

  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
