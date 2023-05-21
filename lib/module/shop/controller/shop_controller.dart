import 'package:flutter/material.dart';
import 'package:fively/state_util.dart';
import '../view/shop_view.dart';

class ShopController extends State<ShopView> implements MvcController {
  static late ShopController instance;
  late ShopView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}