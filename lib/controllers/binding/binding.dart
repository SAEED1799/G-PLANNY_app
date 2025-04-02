import 'package:get/get.dart';
import 'package:todoapp/controllers/admin_page_controller.dart';
import 'package:todoapp/controllers/main_controller.dart';
import 'package:todoapp/controllers/project_controller.dart';
import 'package:todoapp/controllers/search_controller.dart';
import 'package:todoapp/controllers/volunteer_controller.dart';

import '../auth_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<MainController>(MainController(), permanent: true);
    Get.put<SearchController>(SearchController(), permanent: true);
    Get.put<VolunteerController>(VolunteerController(), permanent: true);
    Get.put<AdminController>(AdminController(), permanent: true);

    Get.put<ProjectController>(ProjectController());
  }
}
