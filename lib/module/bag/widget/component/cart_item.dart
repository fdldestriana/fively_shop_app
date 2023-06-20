import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.product,
      required this.color,
      required this.size,
      required this.addProduct,
      required this.removeProduct,
      required this.itemCount});

  final Product product;
  final String color;
  final String size;
  final Function()? addProduct;
  final Function()? removeProduct;
  final int itemCount;

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
              bottomLeft: Radius.circular(Get.width * 0.02),
            ),
            child: Image.network(
              '${dotenv.env['IMAGE']}${product.name.toLowerCase().replaceAll(' ', '_')}.jpeg?alt=media&token=${product.image}',
              width: Get.width * 0.24,
              height: Get.height * 0.13,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  width: Get.width * 0.24,
                  height: Get.height * 0.13,
                  child: Text("Whoops!\n${error.toString()}"),
                );
              },
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            overflow: TextOverflow.fade,
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
                    ),
                    SizedBox(width: Get.width * 0.14),
                    PopupMenuButton(
                      color: ColorLib.white,
                      icon: const Icon(Icons.more_vert, color: Colors.black),
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          child: const Center(
                            child: Text('Add to favorites'),
                          ),
                          onTap: () async => await Hive.box('favorites_box')
                              .put(product.id, product),
                        ),
                        PopupMenuItem(
                          child: const Center(
                            child: Text('Delete from the list'),
                          ),
                          onTap: () async =>
                              await Hive.box('cart_box').delete(product.id),
                        )
                      ],
                      offset: Offset(
                        -(Get.width * 0.10),
                        -(Get.height * 0.05),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Get.width * 0.02),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: removeProduct,
                          icon: const Icon(Icons.remove),
                        ),
                        Text('$itemCount'),
                        IconButton(
                          onPressed: addProduct,
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
                    SizedBox(width: Get.width * 0.10),
                    Text('\$${(product.price * itemCount) / 100}')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
