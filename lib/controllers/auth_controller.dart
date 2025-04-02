import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/view/modules/volunteer.dart';
import 'package:todoapp/view/screens/auth/login.dart';
import 'package:todoapp/view/screens/costs.dart';
import 'package:todoapp/view/screens/home.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController permission = TextEditingController();
  TextEditingController uid = TextEditingController();

  String date = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Volunteer valunteer = Volunteer();
  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
  String get user => _firebaseUser.value?.email ?? "hosam";

  void createUser() async {
    // user = User();
    if (_validateid() &&
        _validatename() &&
        _validatephone() &&
        _validatedate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .whenComplete(() {
          /// go to home page
          Get.snackbar("Account created succesfully", "",
              snackPosition: SnackPosition.BOTTOM);
        });
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          "Error creating account",
          e.code,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    User userr = _auth.currentUser!;
    final userid = userr.uid;
    valunteer = Volunteer.fromvolunteer(
        id.text, name.text, date, emailController.text, phone.text, userid);
    valunteer.add(databaseRef);
    set();
    Get.to(() => const Home());
  }

  void login() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .whenComplete(() {
        ///go to home page
        _auth.currentUser?.email;
        Get.snackbar("logged in succesfully", "",
            snackPosition: SnackPosition.BOTTOM);
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Log in error",
        e.code,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    Fluttertoast.showToast(
        msg: "Logged in succesfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    uid.text = _auth.currentUser!.uid;
    valunteer.uid = uid.text;

    valunteer.get(databaseRef);
    set();
    print(valunteer.uid);
    Get.to(() => const Home());
  }

  void signOut() async {
    await _auth.signOut();
    name.text = "";
    phone.text = "";
    emailController.text = "";
    id.text = "";
    date = "";
    permission.text = "";
    age.text = "";
    uid.clear();
    Get.to(() => Login());
  }

  bool _validateid() {
    String idtext = id.text;
    String pattern = r'[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (idtext.isEmpty) {
      Get.snackbar(
        "Error creating account",
        'Please enter your ID',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (id.text.length != 9) {
      Get.snackbar(
        "Error creating account",
        'Please enter valid ID',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;

    /// sent msg!!
  }

  bool _validatephone() {
    String phoneText = phone.text;
    String pattern = r'[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (phoneText.isEmpty) {
      Get.snackbar(
        "Error creating account",
        'Please enter mobile number',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (!regExp.hasMatch(phoneText)) {
      Get.snackbar(
        "Error creating account",
        'Please enter valid mobile number',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else if (phoneText[0] != "0") {
      Get.snackbar(
        "Error creating account",
        'Please enter valid mobile number',
        snackPosition: SnackPosition.BOTTOM,
      );

      return false;
    }
    print("lol");
    return true;

    /// sent msg!!
  }

  bool _validatename() {
    String nname = name.text;
    if (nname.isEmpty) {
      Get.snackbar(
        "Error creating account",
        "Please enter your name",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  bool _validatedate() {
    String datee = date;
    if (date.isEmpty) {
      Get.snackbar(
        "Error creating account",
        "Please choose your date of birth",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  void changeDate(String newDate) {
    date = newDate;
    update();
  }

  void edit() {
    final authuser = _auth.currentUser!;
    final userid = authuser.uid;
    valunteer = Volunteer.fromvolunteer(
        id.text, name.text, date, emailController.text, phone.text, userid);

    valunteer.add(databaseRef);
  }

  void set() {
    name.text = valunteer.name;
    id.text = valunteer.id;
    date = valunteer.date;

    phone.text = valunteer.phone;

    emailController.text = valunteer.email;

    permission.text = valunteer.permission;
    uid.text = valunteer.uid;
  }
}
