import 'package:broline/Providers/AuthProvider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Home.dart';
import 'LoginPage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider<AuthProvider>(
        create: (_)=>AuthProvider(),
      ),
    ],
        child:MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeController(),
        ));
  }
}
class HomeController extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthProvider>();

    return StreamBuilder(
      stream: auth.onAuthStateChanged ,
      builder: (context,snapshot){

        if(snapshot.hasData){ // if user is currently signed in
          return Home(auth.currentUser.phoneNumber);
        }
        return LoginPage();
      },
    );
  }
}
