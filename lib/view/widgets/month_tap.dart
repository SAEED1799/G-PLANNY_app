import 'package:flutter/material.dart';

class MonthTap extends StatelessWidget {
  String month;

  MonthTap({Key? key, required this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: const Icon(Icons.date_range_rounded),
      child: Text(
        month,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, fontFamily: "David"),
      ),
    );
  }
}
