import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BagController extends State<BagView> implements MvcController {
  static late BagController instance;
  late BagView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          isVisible = true;
          setState(() {});
        }
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          isVisible = false;
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  late ScrollController scrollController;
  bool isVisible = true;

  // List<ItemCart> itemCarts = [];
  // // DatabaseService databaseService = DatabaseService();
  // Future<List<ItemCart>> getData() async {
  //   itemCarts = await databaseService.getItemCartList();
  //   return itemCarts;
  // }
}
