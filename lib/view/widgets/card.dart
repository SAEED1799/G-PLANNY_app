import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title, date, admin;
  const ProjectCard(
      {Key? key, required this.title, required this.date, required this.admin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = Theme.of(context).cardColor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [cardColor, cardColor],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 1,
                // offset: Offset(0, 6),
              )
            ]),
        child: Column(
          children: [
            /// title
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_tree),
                ),
                const Text(
                  "Project name: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: "Cairo"),
                ),
                Text(
                  title,
                  style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Cairo"),
                ),
              ],
            ),

            /// date
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.date_range),
                ),
                const Text(
                  "Date: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "Cairo"),
                ),
                Text(date),
              ],
            ),

            /// admin
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_box),
                ),
                const Text(
                  "Manager: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "Cairo"),
                ),
                Text(admin),
              ],
            ),

            ///
          ],
        ),
      ),
    );
  }
}
