import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Map<String, dynamic> profileMenus = {
    "My orders": "Already have \$ orders",
    "Shipping addresses": "Adresses",
    "Payment methods": "Visa ****",
    "Promocodes": "You have \$ special promocodes",
    "My reviews": "Reviews for \$ items",
    "Settings": "Notifications, password"
  };

  void navigatoProfileMenu(String menu) {
    switch (menu) {
      case "My orders":
        Get.to(const MyOrdersView());
    }
  }
}
