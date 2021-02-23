import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Query addProfile = FirebaseDatabase.instance.reference().child(
      "Users").orderByChild("phoneno").equalTo(
      FirebaseAuth.instance.currentUser.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: StreamBuilder(
        stream: addProfile.onValue,
        builder: (context, snapshot) {
          Map map = snapshot.data.snapshot.value;
          return RaisedButton(child: Text('Add Profile'), onPressed: () {
            FirebaseDatabase.instance.reference().child(
                "Users").child(map.keys.toList()[0]).update({
              'name': 'Titus',
            });
          },);
        },

      ),
    );
  }
}
