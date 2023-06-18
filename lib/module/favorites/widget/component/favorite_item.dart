import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem(
      {super.key,
      required this.color,
      required this.size,
      required this.product});

  final String color;
  final String size;

  final Product product;

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
                  '${dotenv.env['IMAGE']}${product.name.toLowerCase().replaceAll(' ', '_')}.jpeg?alt=media&token=${product.image}',
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
                            product.brand,
                            style: GoogleFonts.montserrat(
                                color: ColorLib.gray, fontSize: 11),
                          ),
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                                color: ColorLib.black, fontSize: 13),
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
                      Text('${product.price / 100} \$'),
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
            onPressed: () async {
              await Hive.box('favorites_box').delete(product.id);
            },
            icon: Icon(
              Icons.close,
              color: ColorLib.gray,
            ),
          ),
        ),
        Positioned(
          right: -Get.width * 0.01,
          bottom: -Get.height * 0.02,
          child: ValueListenableBuilder(
            valueListenable: Hive.box('cart_box').listenable(),
            builder: (_, value, __) => ReAddToCartButton(
              onTap: () async {
                if (value.containsKey(product.id)) {
                  int index = value.keys.toList().indexOf(product.id);

                  int itemCount = value.values.elementAt(index)['itemCount'];
                  print('element at $index count $itemCount');
                  await value.putAt(
                      index, {"product": product, "itemCount": itemCount + 1});
                  print('element at $index count $itemCount');
                  print(value.values);
                }
                await Hive.box('cart_box')
                    .put(product.id, {"product": product, "itemCount": 1});
              },
            ),
          ),
        ),
      ],
    );
  }
}
