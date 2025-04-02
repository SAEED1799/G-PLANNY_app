import 'package:get/get.dart';
import 'package:todoapp/view/screens/costs.dart';
import 'package:todoapp/view/screens/schedule.dart';
import 'package:todoapp/view/screens/user_profile.dart';
import 'package:todoapp/view/screens/volunteer.dart';

class MainController extends GetxController {
  int selectedIndex = 0;
  getPage(int index) {
    if (index == 0) {
      return Schedule();
    } else if ((index == 1)) {
      return Volunteers();
    } else if ((index == 2)) {
      return const Costs();
    } else if ((index == 3)) {
      return;
    } else if ((index == 4)) {
      return const ProfilePage();
    }
  }

  changeIndex(index) {
    selectedIndex = index;
    update();
  }
}
