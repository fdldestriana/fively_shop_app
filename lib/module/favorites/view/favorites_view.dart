import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';
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
          automaticallyImplyLeading: false,
          backgroundColor: ColorLib.background,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.12),
            child: Padding(
              padding: EdgeInsets.only(left: Get.width * 0.04),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Favorites",
                      style: GoogleFonts.montserrat(
                          color: ColorLib.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Filter',
                          style: GoogleFonts.montserrat(
                              color: ColorLib.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        ValueListenableBuilder(
                          builder: (context, value, child) {
                            return DropdownButton<String>(
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.02),
                              dropdownColor: ColorLib.background,
                              elevation: 0,
                              icon: const Icon(Icons.filter_alt_sharp),
                              items: controller.filterDropdown
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (String? value) {
                                controller.dropDown.value = value!;
                                controller.filterDropdown
                                    .remove(controller.dropDown.value);
                                controller.filterDropdown
                                    .insert(0, controller.dropDown.value);
                              },
                              style: GoogleFonts.montserrat(
                                  color: ColorLib.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              underline: Container(height: 0),
                              value: controller.dropDown.value,
                            );
                          },
                          valueListenable: controller.dropDown,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // property below is used to prevent appbar color changing while scrolling the body
          scrolledUnderElevation: 0.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: Get.width * 0.04,
            right: Get.width * 0.04,
            top: Get.height * 0.02),
        child: ValueListenableBuilder<String>(
          valueListenable: controller.dropDown,
          builder: (context, value, child) {
            return ValueListenableBuilder(
              valueListenable: Hive.box('favorites_box').listenable(),
              builder: (BuildContext context, value, Widget? _) {
                var products = value.values.toList();
                if (controller.dropDown.value == "Highest to low") {
                  products.sort((b, a) => a.price.compareTo(b.price));
                }
                return ListView.separated(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return FavoriteItem(
                      color: 'Black',
                      product: products[index],
                      size: 'L',
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: Get.height * 0.03),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  State<FavoritesView> createState() => FavoritesController();
}
