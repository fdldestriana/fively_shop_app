import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class MyOrdersController extends State<MyOrdersView>
    with TickerProviderStateMixin
    implements MvcController {
  static late MyOrdersController instance;
  late MyOrdersView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  late final TabController tabController;
}
