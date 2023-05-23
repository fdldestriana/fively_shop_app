import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemList extends StatelessWidget {
  const ProductItemList(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.products});
  final String title;
  final String subTitle;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * 0.04),
      child: SizedBox(
        height: Get.height * 0.42,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                          color: ColorLib.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      subTitle,
                      style: GoogleFonts.montserrat(
                          color: ColorLib.gray,
                          fontSize: 11,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const ReViewAllButton()
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: Get.width * 0.05,
                ),
                shrinkWrap: true,
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductItem(
                  product: products[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
