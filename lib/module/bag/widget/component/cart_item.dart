import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.image,
      required this.name,
      required this.color,
      required this.size,
      required this.price});

  final String image;
  final String name;
  final String color;
  final String size;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          color: ColorLib.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Get.width * 0.02),
                bottomLeft: Radius.circular(Get.width * 0.02)),
            child: Image.asset(
              image,
              width: Get.width * 0.28,
              height: Get.height * 0.13,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.montserrat(
                            color: ColorLib.black, fontSize: 16),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Color: ',
                          style: GoogleFonts.montserrat(color: ColorLib.gray),
                          children: [
                            TextSpan(
                                text: '$color    ',
                                style: GoogleFonts.montserrat(
                                    color: ColorLib.black)),
                            TextSpan(
                                text: 'Size: ',
                                style: GoogleFonts.montserrat(
                                    color: ColorLib.gray)),
                            TextSpan(
                                text: size,
                                style: GoogleFonts.montserrat(
                                    color: ColorLib.black))
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: Get.width * 0.08),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.remove)),
                      const Text('1'),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  SizedBox(width: Get.width * 0.22),
                  Text('$price\$')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
