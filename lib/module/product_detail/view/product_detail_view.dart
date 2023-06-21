import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key, required this.product}) : super(key: key);

  final Product product;
  Widget build(context, ProductDetailController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: AppBar(
        backgroundColor: ColorLib.background,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          product.name,
          style: GoogleFonts.montserrat(
              color: ColorLib.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              '${dotenv.env['IMAGE']}${product.name.toLowerCase().replaceAll(' ', '_')}.jpeg?alt=media&token=${product.image}',
              width: double.infinity,
              height: Get.height * 0.51,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ReOutlinedBox(title: 'Size'),
                    const ReOutlinedBox(title: 'Color'),
                    ReFavoriteButton(product: product),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: GoogleFonts.montserrat(
                          color: ColorLib.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "\$${product.price / 100}",
                      style: GoogleFonts.montserrat(
                          color: ColorLib.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(product.brand),
                    Row(
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
                    const Text(
                      """Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
                        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                        culpa qui officia deserunt mollit anim id est laborum.""",
                      maxLines: 2,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.02, horizontal: Get.width * 0.04),
        child: ReButton(
          onPressed: () {},
          width: Get.width * 0.91,
          height: Get.height * 0.06,
          child: Text(
            "ADD TO CART",
            style: GoogleFonts.montserrat(color: ColorLib.white),
          ),
        ),
      ),
    );
  }

  @override
  State<ProductDetailView> createState() => ProductDetailController();
}
