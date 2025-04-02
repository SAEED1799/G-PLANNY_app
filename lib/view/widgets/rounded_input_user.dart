import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedInputUser extends StatelessWidget {
  TextEditingController id;
  String labelText;
  Icon icon;
  RoundedInputUser(
      {Key? key, required this.id, required this.labelText, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        width: 90.w,
        // height: 8.h,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(29),
        ),
        child: TextFormField(
          controller: id,
          decoration: InputDecoration(
            icon: icon,
            labelText: labelText,
            border: InputBorder.none,
          ),
        ),
      );
    });
  }
}
