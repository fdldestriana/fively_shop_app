import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;
    final Stream<QuerySnapshot> productsStream =
        FirebaseFirestore.instance.collection('products').snapshots();

    return Scaffold(
      backgroundColor: ColorLib.background,
      body: StreamBuilder<QuerySnapshot>(
        stream: productsStream,
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) =>
                ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/banner.jpeg',
                  width: double.infinity,
                  height: Get.height * 0.24,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: Get.width * 0.04,
                  bottom: Get.height * 0.03,
                  child: Text(
                    'Urban sneakers',
                    style: GoogleFonts.montserrat(
                        color: ColorLib.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            ProductItemList(
              title: 'Sale',
              subTitle: 'Super summer sale',
              products: snapshot.data!.docs
                  .map((e) => e.data())
                  .toList()
                  .map((e) => Product.fromFirestore(e as Map<String, dynamic>))
                  .toList(),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            ProductItemList(
              title: 'New',
              subTitle: 'You\'ve never seen before!',
              products: snapshot.data!.docs
                  .map((e) => e.data())
                  .toList()
                  .map((e) => Product.fromFirestore(e as Map<String, dynamic>))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
