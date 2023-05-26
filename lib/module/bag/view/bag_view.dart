import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

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
          leadingWidth: 0,
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
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
        child: ListView(
          children: [
            Container(
              width: Get.width * 0.91,
              height: Get.height * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.02),
                color: ColorLib.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Get.width * 0.02),
                        bottomLeft: Radius.circular(Get.width * 0.02)),
                    child: Image.asset(
                      'assets/images/banner.jpeg',
                      width: Get.width * 0.28,
                      height: Get.height * 0.13,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Column(
                        children: [
                          Text('Pullover'),
                          Text('Color:Black'),
                          Text('Size:L')
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                          ),
                          const Text('51\$')
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<BagView> createState() => BagController();
}
