import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User get currentUser=>_auth.currentUser;


  Stream<String> get onAuthStateChanged =>
      _auth.authStateChanges().map(
            (User user) => user.uid,
      );

}