// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fively/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  Widget build(context, HomeController controller) {
    controller.view = this;
    ProductRepository productRepository = ProductRepository();

    return Scaffold(
      backgroundColor: ColorLib.background,
      body: FutureBuilder<List<Product>>(
        future: productRepository.getProductsFirestore(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Loading ....'),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text('There is some error ${snapshot.error}'),
              );
            } else {
              return ListView(
                padding: EdgeInsets.only(top: 0, bottom: Get.height * 0.01),
                children: [
                  const HomeBanner(),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ProductItemList(
                    title: 'Sale',
                    subTitle: 'Super summer sale',
                    products: snapshot.data!,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ProductItemList(
                    title: 'New',
                    subTitle: 'You\'ve never seen before!',
                    products: snapshot.data!,
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
