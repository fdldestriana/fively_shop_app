import 'package:flutter/material.dart';
import 'package:fively/core.dart';

class FavoritesController extends State<FavoritesView>
    implements MvcController {
  static late FavoritesController instance;
  late FavoritesView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
