import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class VolunteerController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController permission = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController userPhone = TextEditingController();
  TextEditingController uid = TextEditingController();
  TextEditingController userUid = TextEditingController();
  String date = "";
  String userDate = "";
  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
  String get user => _firebaseUser.value?.email ?? "hosam";

  // remove this project from database!
  Future<void> add(databaseRef) async {
    /// need to add month later!
    final allProjects = databaseRef.child("allVolunteers").child(uid);
    await allProjects.set({
      'ID': id.text,
      'name': name.text,
      'date of birth': date,
      'phone number': phone.text,
      'email': emailController.text,
      'Permission': false,
    });
  }

  void updateUser() {
    databaseRef.child("allVolunteers").child(userUid.text).update({
      "name": userName.text,
      'phone number': userPhone.text,
      'date of birth': userDate,
    });
    Fluttertoast.showToast(
        msg: "Edit profile succesfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    get();
    print("pol" + uid.text.toString());
    Get.back();
    update();
  }

  Future<void> set() async {
    uid.text = _auth.currentUser!.uid.toString();

    final allProjects = databaseRef.child("allVolunteers").child(uid.text);
    await allProjects.set({
      'ID': id.text,
      'name': name.text,
      'date of birth': date,
      'phone number': phone.text,
      'email': emailController.text,
      'Permission': false,
    });

    // /// need to add month later!
    // databaseRef
    //     .child("allVolunteers")
    //     .child(uid.text)
    //     .once()
    //     .then((DataSnapshot snapshot) {
    //   Map<dynamic, dynamic> values = snapshot.value;
    //   {
    //     id.text = values["ID"].toString();
    //     // print(values);

    //     name.text = values["name"].toString();
    //     date = values["date of birth"].toString();
    //     phone.text = values["phone number"].toString();
    //     emailController.text = values["email"].toString();
    //     permission.text = values["Permission"].toString();
    //     id.text = values["ID"].toString();
    //   }
    // });
  }

  void resetControllers() {
    name.text = "";
    date = "";
    phone.text = "";
    emailController.text = "";
    permission.text = "";
    id.text = "";
  }

  void updateNameAndPhone(String uid) {
    userUid.text = uid;
    databaseRef
        .child("allVolunteers")
        .child(uid)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      {
        userName.text = values["name"].toString();
        userPhone.text = values["phone number"].toString();
        userDate = values["date of birth"].toString();
      }
    });
  }

  void get() async {
    uid.text = _auth.currentUser!.uid.toString();

    databaseRef
        .child("allVolunteers")
        .child(uid.text)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      {
        name.text = values["name"].toString();
        date = values["date of birth"].toString();
        phone.text = values["phone number"].toString();
        emailController.text = values["email"].toString();
        permission.text = values["Permission"].toString();
        id.text = values["ID"].toString();
      }
    });
    update();
  }

  void changeUserDate(String newDate) {
    userDate = newDate;
    update();
  }

  void changeDate(String newDate) {
    date = newDate;
    update();
  }

  String calcage(String bday) {
    String birth_year = bday;
    birth_year = birth_year.substring(0, 4);
    var age = DateTime.now().year - num.parse(birth_year);
    return age.toString();
  }

  Future<void> removevolunteer(String uuid) async {
    databaseRef.child("allVolunteers").child(uuid).remove();
    final FirebaseAuth _auth = FirebaseAuth.instance;
  }

  void makeadmin(String key) {
    databaseRef
        .child("allVolunteers")
        .child(key)
        .update({"Permission": "true"});
    update();
  }

  bool isUserAdmin(String id) {
    print("lol: " + id.toString());
    databaseRef
        .child("allVolunteers")
        .child(id)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      {
        if (values["Permission"] == "true") return false;
      }
    });
    return true;
  }

  bool isadmin() {
    get();
    return permission.text == 'true';
  }
}
