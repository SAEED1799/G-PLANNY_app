import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/controllers/volunteer_controller.dart';
import 'package:todoapp/view/widgets/search_input_text.dart';
import 'package:todoapp/view/widgets/show_volunteers.dart';

class Volunteers extends StatelessWidget {
  const Volunteers({Key? key}) : super(key: key);

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
          const Expanded(
            child: SizedBox(child: Showvolunteers()),
          ),
        ],
      ),
    );
  }

  getpage(index) {}
}
