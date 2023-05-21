import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import '../controller/bag_controller.dart';

class BagView extends StatefulWidget {
  const BagView({Key? key}) : super(key: key);

  Widget build(context, BagController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bag"),
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
  State<BagView> createState() => BagController();
}