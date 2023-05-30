import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem(
      {super.key,
      required this.image,
      required this.brand,
      required this.name,
      required this.color,
      required this.size,
      required this.price});

  final String image;
  final String brand;
  final String name;
  final String color;
  final String size;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width * 0.02),
              color: ColorLib.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Get.width * 0.02),
                  bottomLeft: Radius.circular(Get.width * 0.02),
                ),
                child: Image.network(
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
                            brand,
                            style: GoogleFonts.montserrat(
                                color: ColorLib.gray, fontSize: 11),
                          ),
                          Text(
                            name,
                            style: GoogleFonts.montserrat(
                                color: ColorLib.black, fontSize: 16),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Color: ',
                              style:
                                  GoogleFonts.montserrat(color: ColorLib.gray),
                              children: [
                                TextSpan(
                                  text: '$color    ',
                                  style: GoogleFonts.montserrat(
                                      color: ColorLib.black),
                                ),
                                TextSpan(
                                  text: 'Size: ',
                                  style: GoogleFonts.montserrat(
                                      color: ColorLib.gray),
                                ),
                                TextSpan(
                                  text: size,
                                  style: GoogleFonts.montserrat(
                                      color: ColorLib.black),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: Get.width * 0.08),
                    ],
                  ),
                  Row(
                    children: [
                      Text('$price\$'),
                      SizedBox(width: Get.width * 0.14),
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: '#FFBA49'.toColor(),
                          size: 14,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              color: ColorLib.gray,
            ),
          ),
        ),
        Positioned(
          right: -Get.width * 0.01,
          bottom: -Get.height * 0.02,
          child: ReAddToCartButton(
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
