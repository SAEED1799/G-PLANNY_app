import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/main_controller.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => FFNavigationBar(
        theme: FFNavigationBarTheme(
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
        ),
        selectedIndex: controller.selectedIndex,
        onSelectTab: (index) {
          controller.changeIndex(index);
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.calendar_today,
            label: 'Schedule',
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: 'Volunteers',
          ),
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.note,
            label: 'suggestions',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}
