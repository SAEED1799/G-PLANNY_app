import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/view/widgets/profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: ProfileScreen(),
    );
  }
}
