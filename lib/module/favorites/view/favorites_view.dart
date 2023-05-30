import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  Widget build(context, FavoritesController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.12),
        child: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: ColorLib.background,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.12),
            child: Padding(
              padding: EdgeInsets.only(left: Get.width * 0.04),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Favorites",
                  style: GoogleFonts.montserrat(
                      color: ColorLib.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          // property below is used to prevent appbar color changing while scrolling the body
          scrolledUnderElevation: 0.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? _) {
            return ListView.separated(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final product = value.getAt(index) as Product;
                return FavoriteItem(
                  image:
                      '${dotenv.env['IMAGE']}${product.name.toLowerCase().replaceAll(' ', '_')}.jpeg?alt=media&token=${product.image}',
                  brand: product.brand,
                  name: product.name,
                  color: 'Black',
                  size: 'L',
                  price: product.price,
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: Get.height * 0.03),
            );
          },
          valueListenable: Hive.box('favorite_box').listenable(),
        ),
      ),
    );
  }

  @override
  State<FavoritesView> createState() => FavoritesController();
}
