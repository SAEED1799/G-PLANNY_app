import 'package:flutter/material.dart';

class VolunteerCard extends StatelessWidget {
  final String name, age, email, phone;
  const VolunteerCard(
      {Key? key,
      required this.name,
      required this.age,
      required this.email,
      required this.phone})
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
            /// name
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_tree),
                ),
                const Text(
                  "Volunteer Name: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: "Cairo"),
                ),
                Text(
                  name,
                  style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Cairo"),
                ),
              ],
            ),

            /// age
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.date_range),
                  const Text(
                    "Age: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: "Cairo"),
                  ),
                  Text(age),
                ],
              ),
            ),

            //phone number
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.account_box),
                ),
                const Text(
                  "Phone number: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "Cairo"),
                ),
                Text(phone),
              ],
            ),

            ///
          ],
        ),
      ),
    );
  }
}
