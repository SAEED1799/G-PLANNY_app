import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/view/widgets/rounded_input_user.dart';

class Signup extends GetWidget<AuthController> {
  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: GetBuilder<AuthController>(
          builder: (controller) => SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  const Image(image: AssetImage("assets/1.png")),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text("create a new account"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
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
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 90.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
                          controller: controller.id,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'ID',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
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
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 90.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
                          controller: controller.name,
                          // keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'name',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
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
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 90.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
                          controller: controller.phone,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.phone),
                              labelText: 'Phone number',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
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
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 90.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
                          controller: controller.emailController,
                          // keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'Email address',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
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
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 90.w,
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          // keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              labelText: 'Password',
                              border: InputBorder.none),
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
                                controller.changeDate(
                                    date.toString().split(" ").first);
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
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ),
                        onPressed: () => controller.createUser(),
                        child: Padding(
                          padding: EdgeInsets.all(2.0.h),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
