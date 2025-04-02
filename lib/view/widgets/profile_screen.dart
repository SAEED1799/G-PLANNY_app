import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/controllers/volunteer_controller.dart';
import 'package:todoapp/view/modules/volunteer.dart';
import 'package:todoapp/view/screens/edit_volunteer.dart';
import 'package:todoapp/view/widgets/show_activity_of_volunteer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
              Color.fromRGBO(4, 9, 35, 1),
              Color.fromRGBO(39, 105, 171, 1)
            ],
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter))),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: GetBuilder<AuthController>(
            builder: (controller) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 34),
                child: Column(children: [
                  GetBuilder<AuthController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon(Icons.arrow_back, color: Colors.white),
                        IconButton(
                            onPressed: () {
                              controller.signOut();
                            },
                            icon:
                                const Icon(Icons.logout, color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'My Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 600,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 70,
                                ),
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, top: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GetBuilder<VolunteerController>(
                                              builder: (cont) => IconButton(
                                                onPressed: () {
                                                  cont.updateNameAndPhone(
                                                      controller.uid.text);
                                                  Get.to(() =>
                                                      const Editprofile());
                                                },
                                                icon:
                                                    const Icon(Icons.mode_edit),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      Text(
                                        controller.name.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[800],
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text("ID: " + controller.id.text),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text("Phone number: " +
                                              controller.phone.text),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text("Email: " +
                                              controller.emailController.text),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text("Date of birth: " +
                                              controller.date),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                            const Text(
                              "My Activities",
                              style: TextStyle(color: Colors.white),
                            ),
                            const Expanded(child: ShowActivityOfVolunteer()),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("assets/User-7.png"),
                                fit: BoxFit.cover),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(90),
                            ),
                          ),
                          child: const SizedBox(
                            height: 150,
                          ),
                        ),
                      ),
                    ],
                  ),
                ])),
          )),
        )
      ],
    );
  }
}
