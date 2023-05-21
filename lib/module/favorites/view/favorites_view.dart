import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import '../controller/favorites_controller.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  Widget build(context, FavoritesController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
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
  State<FavoritesView> createState() => FavoritesController();
}