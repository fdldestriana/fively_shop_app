import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ReViewAllButton extends StatelessWidget {
  const ReViewAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'View all',
        style: GoogleFonts.montserrat(
            color: ColorLib.black, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}
