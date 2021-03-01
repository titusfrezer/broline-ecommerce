import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String phoneno;

  Home(this.phoneno);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Center(
            child:Text('You logged in with $phoneno')
          ),
          RaisedButton(onPressed: (){
            FirebaseAuth.instance.signOut();

          },child: Text('Log out'),)
        ],
      ),
    );
  }
}
