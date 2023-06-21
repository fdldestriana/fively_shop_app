import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  Widget build(context, ShopController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorLib.background,
        bottom: TabBar(
            indicatorColor: ColorLib.primary,
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black54,
            controller: controller.tabController,
            tabs: [
              SizedBox(width: Get.width / 3, child: const Tab(text: 'Women')),
              SizedBox(width: Get.width / 3, child: const Tab(text: 'Men')),
              SizedBox(width: Get.width / 3, child: const Tab(text: 'Kids')),
            ]),
        centerTitle: true,
        title: Text(
          'Categories',
          style: GoogleFonts.montserrat(
              color: ColorLib.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: WillPopScope(
        onWillPop: () async {
          return Future.value(false);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
          child: TabBarView(controller: controller.tabController, children: [
            CategoryList(
                categories: controller.categories, images: controller.women),
            CategoryList(
                categories: controller.categories, images: controller.men),
            CategoryList(
                categories: controller.categories, images: controller.kids),
          ]),
        ),
      ),
    );
  }

  @override
  State<ShopView> createState() => ShopController();
}
