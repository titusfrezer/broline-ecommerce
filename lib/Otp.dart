import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
    DatabaseReference userRef = FirebaseDatabase.instance.reference().child("Users");
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
              userRef.once().then((DataSnapshot snapshot) {
                var key = snapshot.value.keys;
                var DATA = snapshot.value;
                for (var individualkey in key) {
                  if (result.user.phoneNumber == DATA[individualkey]['phoneno']) {
                    print("user Exist");
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => Home(result.user.phoneNumber)
                    ));
                  }else{
                    DatabaseReference addProfile = FirebaseDatabase.instance.reference().child("Users");
                    addProfile.push().set(<dynamic,dynamic>{
                      'name':'Titus',
                      'phoneno':FirebaseAuth.instance.currentUser.phoneNumber
                    });
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>Profile()
                    ));
                  }
                }});
            },
          )
        ],
      ),
    );
  }
}
