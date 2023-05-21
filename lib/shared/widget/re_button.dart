import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class ReButton extends StatelessWidget {
  const ReButton({super.key, required this.child, required this.onPressed});

  final Widget child;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(Get.height * 0.06),
          backgroundColor: ColorLib.primary),
      child: child,
    );
  }
}
