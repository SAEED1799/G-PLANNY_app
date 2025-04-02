import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/view/screens/project/add_project.dart';
import 'package:todoapp/view/widgets/month_tap.dart';
import 'package:todoapp/view/widgets/qr_scanner.dart';
import 'package:todoapp/view/widgets/search_input_text.dart';
import 'package:todoapp/view/widgets/show_projects.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Schedule extends StatelessWidget {
  /// initial index with the corrent month
  final int selectedIndex = DateTime.now().month;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(const AddProject());
        },
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              // color: Colors.green,
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(22, 204, 140, 1),
                    Color.fromRGBO(242, 242, 242, 0.1)
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter),
              // image: DecorationImage(
              //     image: AssetImage("assets/activ_background.jpg"),
              //     fit: BoxFit.cover),
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
                  children: const [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Activities",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "Cairo"),
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
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
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
                        onPressed: () {
                          Get.to(QRViewE());
                        },
                        icon: const Icon(Icons.qr_code_2))
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Expanded(
            child: SizedBox(
                // height: double.infinity,
                child: ShowProjects(
              selectedIndex: selectedIndex,
            )),
          ),
        ],
      ),
    );
  }

  getpage(index) {}
}
