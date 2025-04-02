import 'package:firebase_database/firebase_database.dart';

class Volunteer {
  late String id;
  late String uid;

  late String name;
  late String date;
  late String phone;
  late String email;
  late String permission;

  Volunteer({
    this.name = "",
    this.date = "",
    this.phone = '',
    this.permission = 'user',
    this.email = "",
    this.id = "",
    this.uid = "",
  });

  Volunteer.fromvolunteer(String ident, String volname, String birthdate,
      String emailad, String phonenum, String userid) {
    uid = userid;
    name = volname;
    id = ident;
    date = birthdate;
    email = emailad;
    phone = phonenum;
    permission = 'user';
  }
  void setname(String name) {
    this.name = name;
  }

  void setphone(String phone) {
    this.phone = phone;
  }

  void setdate(String name) {
    this.date = date;
  }

  // remove this project from database!
  Future<void> add(databaseRef) async {
    /// need to add month later!
    final allProjects = databaseRef.child("allVolunteers").child(uid);
    await allProjects.set({
      'ID': id,
      'name': name,
      'date of birth': date,
      'phone number': phone,
      'email': email,
      'Permission': false,
    });
  }

  Future<void> set(databaseRef) async {
    /// need to add month later!
    final allVolunteers = databaseRef.child("allVolunteers").child(uid);
    await allVolunteers.set({
      'name': name,
      'date of birth': date,
      'phone number': phone,
      'Permission': false,
    });
  }

  Future<void> get(databaseRef) async {
    /// need to add month later!
    databaseRef
        .child("allVolunteers")
        .child(uid)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      {
        id = values["ID"].toString();
        // print(values);

        name = values["name"].toString();
        date = values["date of birth"].toString();
        phone = values["phone number"].toString();
        email = values["email"].toString();
        permission = values["Permission"].toString();
        id = values["ID"].toString();
      }
      ;
    });
  }
}
