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
        centerTitle: true,
        title: Text(
          'Categories',
          style: GoogleFonts.montserrat(
              color: ColorLib.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }

  @override
  State<ShopView> createState() => ShopController();
}
