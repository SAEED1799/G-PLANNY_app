import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todoapp/controllers/auth_controller.dart';
import 'package:todoapp/view/screens/auth/signup.dart';

class Login extends GetWidget<AuthController> {
  Login({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Sizer(builder: (context, orientation, deviceType) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<AuthController>(
            builder: (controller) => SingleChildScrollView(
              child: Container(
                height: 100.h,
                decoration: const BoxDecoration(
                  // color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/8.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Image.asset(
                      "assets/logo.png",
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text("Login to your Account"),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextFormField(
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.4.h,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        onPressed: () => controller.login(),
                        child: SizedBox(
                          width: 80.w,
                          height: 8.h,
                          child: Center(
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 4.4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Dont have an account? "),
                        TextButton(
                            onPressed: () => Get.to(Signup()),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
