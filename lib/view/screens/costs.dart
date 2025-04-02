import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todoapp/controllers/admin_page_controller.dart';

class Costs extends StatelessWidget {
  const Costs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(242, 245, 245, 100),
      ),
      child: GetBuilder<AdminController>(
        builder: (controller) => Column(
          children: [
            const Image(
              height: 300,
              image: AssetImage("assets/money.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  )),
                  shadowColor: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            FutureBuilder(
                              future: controller.databaseRef
                                  .child("allProjects")
                                  .once(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  DataSnapshot? a =
                                      snapshot.data as DataSnapshot?;
                                  Map<dynamic, dynamic> value = a?.value;
                                  double counter = 0;
                                  value.forEach((key, value) {
                                    if (value["cost"] != "") {
                                      counter =
                                          counter + double.parse(value["cost"]);
                                    }
                                  });
                                  return Text(
                                    counter.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                        color: Colors.green),
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Money Balance",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        const Image(
                          height: 150,
                          image: AssetImage("assets/costs.png"),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      )),
                      shadowColor: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                  // width: 130,
                                ),
                                FutureBuilder(
                                  future: controller.databaseRef
                                      .child("allProjects")
                                      .once(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      DataSnapshot? a =
                                          snapshot.data as DataSnapshot?;
                                      Map<dynamic, dynamic> value = a?.value;
                                      return Text(
                                        value.length.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.green),
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Activities",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.analytics,
                              size: 84,
                            ),
                          ],
                        ),
                      )),
                ),
                Card(
                    elevation: 8,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
                    shadowColor: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              FutureBuilder(
                                future: controller.databaseRef
                                    .child("allVolunteers")
                                    .once(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    DataSnapshot? a =
                                        snapshot.data as DataSnapshot?;
                                    Map<dynamic, dynamic> value = a?.value;
                                    return Text(
                                      value.length.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.green),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Users",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.person,
                            size: 84,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
