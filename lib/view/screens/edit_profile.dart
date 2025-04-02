import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/controllers/volunteer_controller.dart';

class Editprofile extends GetWidget<VolunteerController> {
  const Editprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Edit profile"),
        ),
        body: GetBuilder<VolunteerController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0.h),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'name',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0.h),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextFormField(
                      controller: controller.phone,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: 'Phone number',
                      ),
                    ),
                  ),
                ),
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
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1940, 3, 5),
                                maxTime: DateTime(2015, 6, 7),
                                onChanged: (date) {}, onConfirm: (date) {
                              controller
                                  .changeDate(date.toString().split(" ").first);
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Row(
                            children: [
                              Text(
                                controller.date,
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
                ),
                SizedBox(
                  height: 4.4.h,
                ),
                ElevatedButton(
                    /* style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),*/
                    onPressed: () => controller.set(),
                    child: Padding(
                      padding: EdgeInsets.all(2.0.h),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
