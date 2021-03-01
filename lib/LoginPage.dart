import 'package:broline/Providers/AuthProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home.dart';
import 'Otp.dart';
import 'Profile.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _codeController = TextEditingController();
  CollectionReference userRef = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                final _auth = FirebaseAuth.instance;
                print(_auth.currentUser);
                _auth.verifyPhoneNumber(
                    phoneNumber: '+16505553434',
                    timeout: Duration(seconds: 60),
                    verificationCompleted:
                        (AuthCredential authCredential) async {
                      try {
                        UserCredential result =
                            await _auth.signInWithCredential(authCredential);
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

                      } catch (e) {
                        print(e);
                      }
                    },
                    verificationFailed: (FirebaseAuthException authException) {
                      print(authException.message);
                    },
                    codeSent: (String verificationId,
                        [int forceResendingToken]) {
                      //show dialog to take input from the user
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Otp(verificationId)));
                    },
                    codeAutoRetrievalTimeout: (verificationId) {
                      print(verificationId);
                    });
              },
            ),
            FlatButton(
                onPressed: () {
                  final auth = context.read<AuthProvider>();
                  auth.Login();
                },
                child: Text('Login with google')),
          ],
        ),
      ),
    );
  }
}
