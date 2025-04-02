import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/controllers/project_controller.dart';
import 'package:todoapp/controllers/search_controller.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:todoapp/view/widgets/show_volunteers_of_activity.dart';
import 'card.dart';

class ShowProjects extends StatelessWidget {
  int selectedIndex;
  ShowProjects({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (controller) {
        return FirebaseAnimatedList(
          query: FirebaseDatabase.instance.reference().child('allProjects'),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map project = snapshot.value;
            return controller.usedSearch(project['name'])
                ? GetBuilder<AuthController>(
                    builder: (authController) => GestureDetector(
                      onTap: () => showMaterialModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (context) => SafeArea(
                          child: GetBuilder<ProjectController>(
                              builder: (proController) {
                            return Container(
                                height: 600,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  // image: DecorationImage(image: AssetImage("assets/8.jpg"), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Icon(Icons.linear_scale_sharp),
                                    // const Image(
                                    //     image: AssetImage(
                                    //         "assets/Volunteers.png")),
                                    Text(
                                      project['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          fontFamily: "Cairo"),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      project['Description'],
                                      style: const TextStyle(
                                          fontSize: 12, fontFamily: "Cairo"),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),

                                    const Text(
                                      "Volunteers",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          fontFamily: "Cairo"),
                                    ),

                                    const Expanded(
                                        child: ShowVolunteersOfActivity()),

                                    Expanded(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.date_range),
                                              const Text(
                                                "Date: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    fontFamily: "Cairo"),
                                              ),
                                              Text(
                                                project['date'],
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              const Icon(Icons.account_box),
                                              const Text(
                                                "Manager: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    fontFamily: "Cairo"),
                                              ),
                                              Text(project['manager']),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                proController.isVolunteered(
                                                    project['name'] +
                                                        project['date']);
                                                showPlatformDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      BasicDialogAlert(
                                                    title: Text(proController
                                                        .dialogTitle(project[
                                                                'name'] +
                                                            project['date'])),
                                                    actions: <Widget>[
                                                      BasicDialogAction(
                                                        title: const Text(
                                                            "Cancel"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      BasicDialogAction(
                                                        title:
                                                            const Text("Yes"),
                                                        onPressed: () {
                                                          proController
                                                              .dialogYes(project[
                                                                      'name'] +
                                                                  project[
                                                                      'date']);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: proController
                                                    .buttonBackground,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  proController.buttonTitle(
                                                      project['name'] +
                                                          project['date']),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 35,
                                                      fontFamily: "Cairo"),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),

                                    /// date
                                  ],
                                ));
                          }),
                        ),
                      ),
                      child: ProjectCard(
                          title: project['name'],
                          date: project['date'],
                          admin: project['manager']),
                    ),
                  )
                : Container();
          },
        );
      },
    );
  }
}
