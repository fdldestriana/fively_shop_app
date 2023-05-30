import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.40,
      height: Get.height * 0.32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '${dotenv.env['IMAGE']}${product.name.toLowerCase().replaceAll(' ', '_')}.jpeg?alt=media&token=${product.image}',
                  width: Get.width * 0.39,
                  height: Get.height * 0.23,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: -Get.width * 0.01,
                bottom: -Get.height * 0.02,
                child: ReFavoriteButton(
                  icon:
                      product.popular ? Icons.favorite : Icons.favorite_border,
                  color: product.popular ? ColorLib.primary : ColorLib.gray,
                  onTap: () async {
                    await Hive.box('favorite_box').put(product.image, product);
                  },
                ),
              )
            ],
          ),
          Expanded(
            child: Row(
              children: [
                ...List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: '#FFBA49'.toColor(),
                    size: 14,
                  ),
                )
              ],
            ),
          ),
          Text(product.name,
              overflow: TextOverflow.ellipsis,
              style:
                  GoogleFonts.montserrat(color: ColorLib.gray, fontSize: 11)),
          Expanded(
            child: Text(
              product.brand,
              style:
                  GoogleFonts.montserrat(color: ColorLib.black, fontSize: 15),
            ),
          ),
          Expanded(
            child: Text(
              '${product.price}',
              style:
                  GoogleFonts.montserrat(color: ColorLib.black, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
