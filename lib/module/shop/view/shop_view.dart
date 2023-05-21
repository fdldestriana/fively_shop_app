import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import '../controller/shop_controller.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  Widget build(context, ShopController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<ShopView> createState() => ShopController();
}