import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/view/screens/auth/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null)
          ? const MainScreen()
          : Login();
    });
  }
}
