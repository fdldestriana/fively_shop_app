import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReOutlinedBox extends StatefulWidget {
  const ReOutlinedBox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ReOutlinedBox> createState() => _ReOutlinedBoxState();
}

class _ReOutlinedBoxState extends State<ReOutlinedBox> {
  String? size;
  String? color;
  String? choice;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
        ),
        fixedSize: Size(Get.width * 0.37, Get.height * 0.06),
      ),
      onPressed: () {
        // showModalBottomSheet(
        //     context: context,
        //     builder: (BuildContext context) => ModalBottomSheetCustom(
        //           title: widget.title,
        //         )).then((value) {
        //   setState(() {
        //     choosen = value;
        //   });
        // });
      },
      child: (choice == null)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.montserrat(color: ColorLib.black),
                ),
                const Icon(
                  Icons.arrow_drop_down_sharp,
                )
              ],
            )
          : Text(
              choice!.toUpperCase(),
            ),
    );
  }
}
