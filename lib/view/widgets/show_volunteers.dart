import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoapp/controllers/auth_controller.dart';

import 'package:todoapp/controllers/volunteer_controller.dart';
import 'package:todoapp/view/screens/edit_volunteer.dart';
import 'package:todoapp/view/widgets/volunteer_card.dart';

import 'card.dart';

class Showvolunteers extends StatelessWidget {
  const Showvolunteers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<VolunteerController>(
        init: VolunteerController(),
        builder: (controller) => FirebaseAnimatedList(
          query: FirebaseDatabase.instance.reference().child('allVolunteers'),
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map volunteers = snapshot.value;
            String key = snapshot.key!;

            return Slidable(
              key: const ValueKey(0),
              // The start action pane is the one at the left or the top side.
              endActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (context) {
                      controller.updateNameAndPhone(key);

                      Get.to(() => const Editprofile());
                    },
                    backgroundColor: const Color(0xFF2dad47),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),

                  SlidableAction(
                    onPressed: (context) {
                      controller.resetControllers();
                    },
                    backgroundColor: const Color(0xFF6da893),
                    foregroundColor: Colors.white,
                    icon: Icons.person,
                    label: 'profile',
                  ),
                ],
              ),
              child: GestureDetector(
                  child: GetBuilder<VolunteerController>(
                builder: (controller) => VolunteerCard(
                    name: volunteers['name'],
                    age: controller.calcage(volunteers['date of birth']),
                    email: volunteers['email'],
                    phone: volunteers['phone number']),
              )),
            );
          },
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
