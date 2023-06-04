import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({Key? key}) : super(key: key);

  Widget build(context, MyOrdersController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: ColorLib.background,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: ColorLib.background,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Get.width * 0.04),
                child: Text(
                  "My Orders",
                  style: GoogleFonts.montserrat(
                      color: ColorLib.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              TabBar(
                controller: controller.tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                indicator: BoxDecoration(
                  color: ColorLib.black,
                  border: Border.all(color: ColorLib.black),
                  borderRadius: BorderRadius.circular(Get.height * 0.02),
                ),
                tabs: [
                  SizedBox(
                    width: Get.width * 0.27,
                    height: Get.height * 0.04,
                    child: const Tab(text: 'Delivered'),
                  ),
                  SizedBox(
                    width: Get.width * 0.27,
                    height: Get.height * 0.04,
                    child: const Tab(text: 'Processing'),
                  ),
                  SizedBox(
                    width: Get.width * 0.27,
                    height: Get.height * 0.04,
                    child: const Tab(text: 'Cancelled'),
                  ),
                ],
                unselectedLabelColor: Colors.black,
              ),
            ],
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: SizedBox(
            height: Get.height * 0.67,
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/images/bag.png'),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    const Text("You have placed no orders")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/images/bag.png'),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    const Text("You have placed no orders")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/images/bag.png'),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    const Text("You have placed no orders")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<MyOrdersView> createState() => MyOrdersController();
}
