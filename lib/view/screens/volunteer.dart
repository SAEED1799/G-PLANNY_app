import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/controllers/volunteer_controller.dart';
import 'package:todoapp/view/screens/project/add_project.dart';
import 'package:todoapp/view/widgets/month_tap.dart';
import 'package:todoapp/view/widgets/search_input_text.dart';
import 'package:todoapp/view/widgets/show_projects.dart';
import 'package:todoapp/view/widgets/show_volunteers.dart';

class Volunteers extends StatelessWidget {
  /// initial index with the corrent month
  final int selectedIndex = DateTime.now().month;

  Volunteers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  image: AssetImage("assets/Volunteers.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    GetBuilder<VolunteerController>(
                      builder: (controller) => Text(
                        "Welcome ${controller.name.text}!",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "Cairo"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Keep Calm and Volunteer!",
                      style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: "Cairo"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const SearchInputText(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list_rounded))
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          const Expanded(
            child: SizedBox(
                // height: double.infinity,
                child: Showvolunteers()),
          ),
        ],
      ),
    );
  }

  getpage(index) {}
}
