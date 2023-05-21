import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class RePhotoPicker extends StatelessWidget {
  const RePhotoPicker(
    this.onTap, {
    super.key,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ReCircleAvatar(
            avatarRadius: 40.0,
            iconSize: 40.0,
            bgCircleAvatar: ColorLib.gray,
            bgIcon: ColorLib.black,
            icon: Icons.person),
        GestureDetector(
          onTap: onTap,
          child: ReCircleAvatar(
            avatarRadius: 16.0,
            iconSize: 16.0,
            bgCircleAvatar: ColorLib.primary,
            bgIcon: ColorLib.white,
            icon: Icons.camera_alt,
          ),
        ),
      ],
    );
  }
}
