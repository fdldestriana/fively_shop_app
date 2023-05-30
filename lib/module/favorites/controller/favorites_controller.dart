import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fively/core.dart';

class FavoritesController extends State<FavoritesView>
    implements MvcController {
  static late FavoritesController instance;
  late FavoritesView view;

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
