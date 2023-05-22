import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Ok",
              style: GoogleFonts.montserrat(color: ColorLib.black),
            ),
          )
        ],
        backgroundColor: Colors.grey[200],
        content: Text(message),
        title: const Text("An error occured"),
      );
    },
  );
}
