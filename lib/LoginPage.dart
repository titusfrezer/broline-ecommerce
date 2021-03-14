import 'package:broline/Models/Colors.dart';
import 'package:broline/Pages/Broline.dart';
import 'package:broline/Providers/AuthProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home.dart';
import 'Otp.dart';
import 'Profile.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _codeController = TextEditingController();

  CollectionReference userRef = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrolineColor.brolineDarkBlue,
        title: Text('Broline'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                Text("Login or Continue with Google")
              ],
            ),
            // Container(
            //   child: Image.asset(
            //     "assets/images/brolineLogo.jpg",
            //     fit: BoxFit.cover,
            //     height: 100,
            //     width: 60,
            //   ),
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
             // padding: EdgeInsets.symmetric(horizontal: 15,),
              decoration: BoxDecoration(
                  border: Border.all(color: BrolineColor.brolineDarkBlue),
                  borderRadius: BorderRadius.circular(25)),
              child: TextFormField(

                keyboardType: TextInputType.number,

                decoration: InputDecoration(
                  contentPadding:   EdgeInsets.symmetric(vertical: 15),

                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: Container(
                    width: 25,
                  alignment: Alignment.center,
                    child: Text("+251",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                  ),
                  suffixIcon: Icon(
                    Icons.phone_android,
                    color: BrolineColor.brolineDarkBlue,
                  ),
                  hintText: "Your Phone Number",
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width - 100,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),

                    textColor: BrolineColor.brolineWhite,
                    color: BrolineColor.brolineDarkBlue,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      final _auth = FirebaseAuth.instance;
                      print(_auth.currentUser);
                      _auth.verifyPhoneNumber(
                          phoneNumber: '+16505553434',
                          timeout: Duration(seconds: 60),
                          verificationCompleted:
                              (AuthCredential authCredential) async {
                            try {
                              UserCredential result = await _auth
                                  .signInWithCredential(authCredential);
                              userRef.get().then((snapshot) {
                                snapshot.docs.forEach((element) {
                                  if (result.additionalUserInfo.isNewUser) {
                                    CollectionReference addProfile =
                                        FirebaseFirestore.instance
                                            .collection("users");

                                    addProfile.add({
                                      'name': 'Titus',
                                      'phoneno': FirebaseAuth
                                          .instance.currentUser.phoneNumber
                                    });
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
                                  } else {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Home(result.user.phoneNumber)));
                                  }
                                });
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                          verificationFailed:
                              (FirebaseAuthException authException) {
                            print(authException.message);
                          },
                          codeSent: (String verificationId,
                              [int forceResendingToken]) {
                            //show dialog to take input from the user
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Otp(verificationId)));
                          },
                          codeAutoRetrievalTimeout: (verificationId) {
                            print(verificationId);
                          });
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: FlatButton(

                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 45,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: BrolineColor.brolineDarkBlue),
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        final auth = context.read<AuthProvider>();
                        auth.Login();
                      },
                      child: Row(

                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            fit: BoxFit.cover,
                            height: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Continue With Google',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
