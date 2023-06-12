import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.color,
    required this.size,
    required this.addProduct,
    required this.removeProduct,
  });

  final Product product;
  final String color;
  final String size;
  final Function()? addProduct;
  final Function()? removeProduct;

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
                        product.name,
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
                  SizedBox(width: Get.width * 0.14),
                  ValueListenableBuilder(
                    builder: (BuildContext _, value, Widget? __) {
                      return PopupMenuButton(
                        color: ColorLib.white,
                        icon: const Icon(Icons.more_vert, color: Colors.black),
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            child:
                                const Center(child: Text('Add to favorites')),
                            onTap: () {},
                          ),
                          PopupMenuItem(
                            child: const Center(
                                child: Text('Delete from the list')),
                            onTap: () => value.delete(product.id),
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
                      );
                    },
                    valueListenable: Hive.box('cart_box').listenable(),
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: addProduct,
                          icon: const Icon(Icons.remove)),
                      const Text('1'),
                      IconButton(
                          onPressed: removeProduct, icon: const Icon(Icons.add))
                    ],
                  ),
                  SizedBox(width: Get.width * 0.20),
                  Text('${product.price / 100} \$')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
