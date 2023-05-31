import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BagView extends StatefulWidget {
  const BagView({Key? key}) : super(key: key);

  Widget build(context, BagController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.12),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorLib.background,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.12),
            child: Padding(
              padding: EdgeInsets.only(left: Get.width * 0.04),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "My Bag",
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
            builder: (context, value, _) {
              return ListView.separated(
                controller: controller.scrollController,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final product = value.getAt(index) as Product;
                  return CartItem(
                    product: product,
                    color: 'Black',
                    size: 'L',
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: Get.height * 0.03),
              );
            },
            valueListenable: Hive.box('cart_box').listenable()),
      ),
      bottomSheet: Visibility(
        visible: controller.isVisible,
        child: BagBottomSheet2(),
      ),
    );
  }

  @override
  State<BagView> createState() => BagController();
}
