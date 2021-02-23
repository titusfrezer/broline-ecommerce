import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Otp.dart';
import 'Profile.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _codeController = TextEditingController();
  DatabaseReference userRef = FirebaseDatabase.instance.reference().child("Users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),

      ),
      body: RaisedButton(
        child: Text('Login'),
        onPressed: () {
          final _auth = FirebaseAuth.instance;
          print(_auth.currentUser);
          _auth.verifyPhoneNumber(

              phoneNumber: '+251962491657',
              timeout:Duration(seconds: 60),
              verificationCompleted: (AuthCredential authCredential) async{

                try{
                  UserCredential result = await _auth.signInWithCredential(authCredential);
                  userRef.once().then((DataSnapshot snapshot) {
                    var key = snapshot.value.keys;
                    var DATA = snapshot.value;
                    for (var individualkey in key) {
                      if (result.user.phoneNumber == DATA['user1']['phoneno']) {
                        print("user Exist");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Home(result.user.phoneNumber)
                        ));
                      }else{
                        DatabaseReference addProfile = FirebaseDatabase.instance.reference().child("Users");
                        addProfile.push().set(<dynamic,dynamic>{
                          'name':'Titus',
                          'phoneno':FirebaseAuth.instance.currentUser.phoneNumber
                        });
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Profile()
                        ));
                      }
                    }});
                }catch(e){
                  print(e);
                }

              },
              verificationFailed: (FirebaseAuthException authException){
                print(authException.message);
              },
              codeSent: (String verificationId, [int forceResendingToken]){
                //show dialog to take input from the user
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Otp(verificationId)));
              },
              codeAutoRetrievalTimeout: ( verificationId){
                print(verificationId);
              });
        },
      ),
    );
  }
}
