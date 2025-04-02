import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AdminController extends GetxController {
  String numberOfActivities = "";
  // TextEditingController NumberOfActivities = TextEditingController();
  TextEditingController NumberOfVolunteers = TextEditingController();
  TextEditingController TotalExpendatiure = TextEditingController();
  double counter = 0;

  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();

  String TotalActivities() {
    databaseRef.child("allProjects").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> value = snapshot.value;
      {
        numberOfActivities = value.length.toString();
        print(value.length.toString());
      }
    });
    update();
    return numberOfActivities;
  }

  String TotalVolunteers() {
    databaseRef.child("allVolunteers").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> value = snapshot.value;
      {
        NumberOfVolunteers.text = value.length.toString();
      }
    });
    return NumberOfVolunteers.text;
  }

  // ignore: non_constant_identifier_names
  String TotalExpendature() {
    /// need to add month later!
    databaseRef.child("allProjects").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> value = snapshot.value;
      value.forEach((key, value) {
        if (value["cost"] != "") {
          counter = counter + double.parse(value["cost"]);
        }
      });
    });

    TotalExpendatiure.text = counter.toString();
    counter = 0;
    return TotalExpendatiure.text;
  }
}
