import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/view/modules/project.dart';

class AddProject extends StatefulWidget {
  const AddProject({Key? key}) : super(key: key);

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  // final int selectedIndex;
  //database reference object
  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();

  // Schedule({Key? key}) : super(key: key);
  String _selectedDate = '';
  TextEditingController projectName = TextEditingController();
  TextEditingController projectAdmin = TextEditingController();
  TextEditingController projectCost = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  bool saving = false;
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("add project"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h, right: 10.w, left: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        controller: projectName,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.trip_origin),
                          labelText: 'project name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.4.h,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        controller: projectAdmin,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'manager',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.4.h,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: projectCost,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.attach_money_rounded),
                          labelText: 'cost',
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        controller: projectDescription,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.inbox),
                          labelText: 'description',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("date"),
                        SizedBox(
                          width: 3.w,
                        ),
                        ElevatedButton(
                            // ignore: prefer_const_constructors
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2021, 3, 5),
                                  maxTime: DateTime(2022, 6, 7),
                                  onChanged: (date) {}, onConfirm: (date) {
                                setState(() {
                                  _selectedDate =
                                      date.toString().split(" ").first;
                                });
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Row(
                              children: [
                                Text(
                                  _selectedDate,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                const Icon(
                                  Icons.date_range,
                                  color: Colors.black,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
                // style: ButtonStyle(
                //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30.0))),
                // ),
                onPressed: _save_project,
                child: Padding(
                  padding: EdgeInsets.all(2.0.w),
                  child: Text(
                    "add project",
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                )),
            SizedBox(
              height: 1.h,
            ),
            saving ? const CircularProgressIndicator() : Container()
          ],
        ),
      );
    });
  }

  // ignore: non_constant_identifier_names
  Future<void> _save_project() async {
    Project project = Project(
        manager: projectAdmin.text,
        name: projectName.text,
        date: _selectedDate,
        description: projectDescription.text,
        cost: projectCost.text);

    if (project.name == '' || project.date == '' || project.description == '') {
      const snackBar = SnackBar(content: Text('please fill all fields'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    setState(() {
      saving = true;
    });

    project.add(databaseRef);

    const snackBar = SnackBar(content: Text('project added successfully!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Get.back();
  }
}
