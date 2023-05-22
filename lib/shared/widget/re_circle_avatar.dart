import 'dart:io';
import 'package:flutter/material.dart';

class ReCircleAvatar extends StatelessWidget {
  const ReCircleAvatar(
      {super.key,
      required this.avatarRadius,
      required this.iconSize,
      required this.bgCircleAvatar,
      required this.bgIcon,
      required this.icon,
      required this.file});
  final double avatarRadius;
  final double iconSize;
  final Color bgCircleAvatar;
  final Color bgIcon;
  final IconData icon;
  final File? file;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: avatarRadius,
      backgroundColor: bgCircleAvatar,
      backgroundImage: file != null ? FileImage(file as File) : null,
      child: file != null
          ? null
          : Icon(
              size: iconSize,
              icon,
              color: bgIcon,
            ),
    );
  }
}
