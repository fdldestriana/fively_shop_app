import 'package:flutter/material.dart';
import 'package:fively/state_util.dart';
import 'package:flutter/rendering.dart';
import '../view/bag_view.dart';

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
                ScrollDirection.forward ||
            scrollController.position.userScrollDirection ==
                ScrollDirection.idle) {
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
}
