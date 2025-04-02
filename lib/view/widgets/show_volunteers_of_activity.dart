import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/project_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:todoapp/controllers/volunteer_controller.dart';

class ShowVolunteersOfActivity extends StatelessWidget {
  const ShowVolunteersOfActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(
      builder: (controller) {
        // print(controller.projectId);
        return FirebaseAnimatedList(
          scrollDirection: Axis.horizontal,
          query: FirebaseDatabase.instance
              .reference()
              .child("allProjects")
              .child(controller.projectId)
              .child("Volunteers"),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            String volunteerId = snapshot.value;

            return Padding(
              padding: const EdgeInsets.all(22.0),
              child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Image(
                        image: AssetImage(
                          "assets/User-7.png",
                        ),
                        height: 70,
                      ),
                      FutureBuilder(
                        future: FirebaseDatabase.instance
                            .reference()
                            .child("allVolunteers")
                            .child(volunteerId)
                            .once(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            DataSnapshot? a = snapshot.data as DataSnapshot?;
                            return Column(
                              children: [
                                Text(
                                  a!.value['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                GetBuilder<VolunteerController>(
                                    builder: (c) => Text("age: " +
                                        c.calcage(a!.value['date of birth']))),
                              ],
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ))),
            );
          },
        );
      },
    );
  }
}
