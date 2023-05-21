import 'package:flutter/material.dart';
import 'package:fively/state_util.dart';
import '../view/bag_view.dart';

class BagController extends State<BagView> implements MvcController {
  static late BagController instance;
  late BagView view;

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