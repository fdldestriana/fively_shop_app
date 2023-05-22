import 'package:flutter/material.dart';
import 'package:fively/core.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  Widget build(context, RootController controller) {
    controller.view = this;
    return Scaffold(
      backgroundColor: ColorLib.background,
      body: controller.pages[controller.currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          backgroundColor: ColorLib.white,
          selectedItemColor: ColorLib.primary,
          unselectedItemColor: ColorLib.gray,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex,
          onTap: (value) => controller.setCurrentIndex(value),
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                    'assets/buttons/bottomnavbar/active/home_activated.png'),
                icon: Image.asset(
                    'assets/buttons/bottomnavbar/inactive/home_inactive.png'),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                    'assets/buttons/bottomnavbar/active/shop_activated.png'),
                icon: Image.asset(
                    'assets/buttons/bottomnavbar/inactive/shop_inactive.png'),
                label: 'Shop'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                    'assets/buttons/bottomnavbar/active/bag_activated.png'),
                icon: Image.asset(
                    'assets/buttons/bottomnavbar/inactive/bag_inactive.png'),
                label: 'Bag'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                    'assets/buttons/bottomnavbar/active/favorites_activated.png'),
                icon: Image.asset(
                    'assets/buttons/bottomnavbar/inactive/favorites_inactive.png'),
                label: 'Favorites'),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                    'assets/buttons/bottomnavbar/active/profile_activated.png'),
                icon: Image.asset(
                    'assets/buttons/bottomnavbar/inactive/profile_inactive.png'),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }

  @override
  State<RootView> createState() => RootController();
}
