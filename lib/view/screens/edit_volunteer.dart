import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/controllers/volunteer_controller.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text("Edit Profile"),
          ),
          body: GetBuilder<VolunteerController>(builder: (controller) {
            print("edit: " + controller.userName.text.toString());
            return SingleChildScrollView(
              child: WillPopScope(
                onWillPop: () async {
                  print("lol");
                  controller.get();
                  Get.back();
                  return false;
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage("assets/edit_profile.jpg"),
                      ),
                      const Text("Edit profile information"),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
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
                              borderRadius: BorderRadius.circular(24),
                            ),
                            width: 90.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: TextFormField(
                                  controller: controller.userName,
                                  // keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      icon: Icon(Icons.person),
                                      labelText: 'name',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.0.h),
                      Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
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
                              borderRadius: BorderRadius.circular(24),
                            ),
                            width: 90.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: TextFormField(
                                  controller: controller.userPhone,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.phone),
                                    border: InputBorder.none,
                                    labelText: 'Phone number',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.0.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Date of birth"),
                            SizedBox(
                              width: 3.w,
                            ),
                            ElevatedButton(
                                // ignore: prefer_const_constructors
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(1940, 3, 5),
                                      maxTime: DateTime(2015, 6, 7),
                                      onChanged: (date) {}, onConfirm: (date) {
                                    controller.changeUserDate(
                                        date.toString().split(" ").first);
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      controller.userDate,
                                      style:
                                          const TextStyle(color: Colors.black),
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
                      ),
                      SizedBox(height: 4.0.h),
                      GetBuilder<AuthController>(
                        builder: (authController) => ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                            onPressed: () {
                              controller.updateUser();
                              authController.valunteer
                                  .get(authController.databaseRef);
                              authController.set();
                            },
                            child: SizedBox(
                              width: 70.w,
                              height: 8.h,
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      controller.isadmin()
                          ? TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                              ),
                              onPressed: () {
                                controller.isUserAdmin(controller.uid.text)
                                    ? showPlatformDialog(
                                        context: context,
                                        builder: (context) => BasicDialogAlert(
                                          title: const Text(
                                              "are you sure that you want to make this user admin?"),
                                          actions: <Widget>[
                                            BasicDialogAction(
                                              title: const Text("Cancel"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            BasicDialogAction(
                                              title: const Text("Yes"),
                                              onPressed: () {
                                                controller.makeadmin(
                                                    controller.uid.text);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container();
                              },
                              child: SizedBox(
                                width: 80.w,
                                height: 8.h,
                                child: Center(
                                  child: Text(
                                    !controller.isUserAdmin(controller.uid.text)
                                        ? "Make this user admin"
                                        : "this user is admin",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: const Color.fromRGBO(
                                            56, 128, 23, 2)),
                                  ),
                                ),
                              ))
                          : Container()
                    ],
                  ),
                ),
              ),
            );
          }));
    });
  }
}
