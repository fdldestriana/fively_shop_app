import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.images,
    required this.categories,
  });

  final List<String> images;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: Get.width * 0.91,
                height: Get.height * 0.12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width * 0.02),
                    color: ColorLib.primary),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SUMMER SALES',
                      style: GoogleFonts.montserrat(
                          color: ColorLib.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Up to 50% off',
                      style: GoogleFonts.montserrat(
                          color: ColorLib.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            );
          }
          if (index > 0) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width * 0.02),
                    color: ColorLib.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Get.width * 0.06),
                      child: Text(
                        categories[index - 1],
                        style: GoogleFonts.montserrat(
                            color: ColorLib.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        images[index - 1],
                        width: Get.width * 0.46,
                        height: Get.height * 0.12,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return null;
        },
        separatorBuilder: (context, index) =>
            SizedBox(height: Get.height * 0.02),
        itemCount: images.length + 1);
  }
}
