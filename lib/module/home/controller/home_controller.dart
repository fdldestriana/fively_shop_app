import 'package:flutter/material.dart';
import 'package:fively/core.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  // List<Product> _products = [];
  // List<Product> get products => _products;
  // Future<void> getProducts() async {
  //   _products = await ProductRepository().getProducts();
  // }
}
