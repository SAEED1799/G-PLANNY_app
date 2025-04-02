import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  String projectId = "";
  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool volunteer = true;
  String volunteersNames = "";
  MaterialStateProperty<MaterialColor> buttonBackground =
      MaterialStateProperty.all(Colors.green);
  List<String> names = <String>[];

  void dialogYes(String id) {
    isVolunteered(id);
    if (volunteer) {
      remove(id);
    } else {
      addUserToProject(id);
    }

    update();
  }

  String buttonTitle(String id) {
    projectId = id;
    isVolunteered(id);
    if (volunteer) {
      buttonBackground = MaterialStateProperty.all(Colors.red);
      update();
      return 'remove';
    } else {
      buttonBackground = MaterialStateProperty.all(Colors.green);
      update();
      return 'Volunteer!';
    }
  }

  String dialogTitle(String id) {
    isVolunteered(id);
    if (volunteer) {
      return 'Are you sure you want to remove?';
    } else {
      return 'Are you sure you want to volunteer?';
    }
  }

  void addUserToProject(String id) async {
    String uid = _auth.currentUser!.uid;
    databaseRef
        .child("allVolunteers")
        .child(uid)
        .child("Projects")
        .update({id: id});

    databaseRef
        .child("allProjects")
        .child(id)
        .child("Volunteers")
        .update({uid: uid});
    volunteer = true;
    volunteersNames = "";

    update();
  }

  isVolunteered(String id) async {
    String uid = _auth.currentUser!.uid;
    DatabaseReference found = databaseRef
        .child("allProjects")
        .child(id)
        .child("Volunteers")
        .child(uid);
    DataSnapshot snapshot = await found.once();
    if (snapshot.value != null) {
      volunteer = true;
      update();
    } else {
      volunteer = false;
      update();
    }
    // volunteersNames
  }

  remove(String id) {
    String uid = _auth.currentUser!.uid;
    databaseRef
        .child("allProjects")
        .child(id)
        .child("Volunteers")
        .child(uid)
        .remove();
    databaseRef
        .child("allVolunteers")
        .child(uid)
        .child("Projects")
        .child(id)
        .remove();

    volunteer = false;
    update();
  }
}
