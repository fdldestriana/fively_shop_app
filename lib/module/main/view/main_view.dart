import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import '../controller/main_controller.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  Widget build(context, MainController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Main"),
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
  State<MainView> createState() => MainController();
}