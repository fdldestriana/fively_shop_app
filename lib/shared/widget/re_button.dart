import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class ReButton extends StatelessWidget {
  const ReButton(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.width,
      required this.height});

  final Widget child;
  final Function()? onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height), backgroundColor: ColorLib.primary),
      child: child,
    );
  }
}
