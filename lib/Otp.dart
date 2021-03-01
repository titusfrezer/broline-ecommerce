import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Profile.dart';

class Otp extends StatelessWidget {
  String verificationId;
  Otp(this.verificationId);
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference userRef = FirebaseFirestore.instance.collection("users");
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP'),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: controller,
            ),

          ),
          FlatButton(
            child: Text("Done"),
            textColor: Colors.white,
            color: Colors.redAccent,
            onPressed: () async {

              AuthCredential _credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: controller.text);
              UserCredential result = await _auth.signInWithCredential(_credential);
              userRef.get().then((snapshot) {
                snapshot.docs.forEach((element) {
                  if (result.additionalUserInfo.isNewUser) {
                    CollectionReference addProfile = FirebaseFirestore
                        .instance
                        .collection("users");

                    addProfile.add({
                      'name': 'Titus',
                      'phoneno': FirebaseAuth
                          .instance.currentUser.phoneNumber
                    });
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => Profile()));
                  }
                  else {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) =>
                                Home(result.user.phoneNumber)));
                  }
                });
              });
            },
          )
        ],
      ),
    );
  }
}
