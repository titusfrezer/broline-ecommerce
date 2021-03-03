import 'package:broline/Models/Colors.dart';
import 'package:broline/Pages/Broline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'Home.dart';
import 'Profile.dart';

class Otp extends StatelessWidget {
  String verificationId;

  Otp(this.verificationId);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("users");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrolineColor.brolineDarkBlue,
        title: Text('OTP Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "OTP Verification",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "We have sent your code to +251*** the code will expire in 3 sec",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: PinCodeTextField(
                onChanged: (value) {},
                appContext: context,
                pastedTextStyle: TextStyle(
                  backgroundColor: BrolineColor.brolineWhite,
                  color: BrolineColor.brolineBlack,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  activeColor: BrolineColor.brolineDarkBlue,
                  inactiveColor: BrolineColor.brolineDarkBlue,
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                cursorColor: Colors.black,

                onCompleted: (value){
                  controller.text = value;
                },
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                controller: controller,
                keyboardType: TextInputType.number,
              )),
          SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width - 100,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 100),
              textColor: BrolineColor.brolineWhite,
              color: BrolineColor.brolineDarkBlue,
              child: Text("Verify" , style: TextStyle(fontSize: 16),),
                onPressed: () async {
print("OTP is ${controller.text}");
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
                                   Broline()));
                      }
                    });
                  });
                },
            ),
          )
        ],
      ),
    );
  }
}
