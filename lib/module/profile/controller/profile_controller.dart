import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fively/state_util.dart';
import '../view/profile_view.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    getUserData();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userData = {};
  getUserData() async {
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();
    userData = data.data() as Map<String, dynamic>;
  }

  List<String> profileMenus = [
    "My orders",
    "Shipping addresses",
    "Payment methods",
    "Promocodes",
    "My reviews",
    "Settings"
  ];
}
