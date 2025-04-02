import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/view/screens/costs.dart';
import 'package:todoapp/view/screens/schedule.dart';
import 'package:todoapp/view/widgets/main_bottom_nav.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        body: controller.getPage(controller.selectedIndex),
        bottomNavigationBar: const MainBottomNav(),
      ),
    );
  }
}
