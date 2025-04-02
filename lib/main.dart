import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/binding/binding.dart';
import 'package:todoapp/view/screens/auth/login.dart';
import 'package:todoapp/view/screens/project/add_project.dart';
import 'package:todoapp/view/screens/schedule.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // theme of the app
    final ThemeData _theme = ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return GetMaterialApp(
      initialBinding: Binding(),
      theme: _theme,
      getPages: [
        GetPage(name: '/', page: () => const MainScreen()),
        GetPage(name: '/Schedule', page: () => Schedule()),
        GetPage(name: '/AddProject', page: () => const AddProject()),
      ],
      home: Login(),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
