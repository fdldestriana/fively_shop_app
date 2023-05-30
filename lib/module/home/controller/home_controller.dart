import 'package:flutter/material.dart';
import 'package:fively/core.dart';
import 'package:hive/hive.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    () async {
      await Hive.openBox('favorite_box');
    };
  }

  @override
  void dispose() async {
    super.dispose();
    await Hive.box('favorite_box').close();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
