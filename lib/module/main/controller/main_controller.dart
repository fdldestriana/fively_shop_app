import 'package:flutter/material.dart';
import 'package:fively/state_util.dart';
import '../view/main_view.dart';

class MainController extends State<MainView> implements MvcController {
  static late MainController instance;
  late MainView view;

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