import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AuthProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;
  AuthProvider(){
    _isSigningIn = false;
  }
  bool get isSigningIn => _isSigningIn;
  set signIn(bool signedIn){
    _isSigningIn = signedIn;
    notifyListeners();
  }
  User get currentUser=>_auth.currentUser;


  Stream<String> get onAuthStateChanged =>
      _auth.authStateChanges().map(
            (User user) => user.uid,
      );

  Future Login() async{
    signIn = true;
    final user = await googleSignIn.signIn();
    if(user == null){
     signIn = false;
     return;
    }else{
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
       signIn = false;
    }
  }

  void logout() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}