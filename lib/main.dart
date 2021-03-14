import 'package:broline/Home.dart';
import 'package:broline/LoginPage.dart';
import 'package:broline/Models/Colors.dart';
import 'package:broline/Pages/Broline.dart';
import 'package:broline/Pages/SellProduct.dart';
import 'package:broline/Pages/SubCategoryPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:broline/Pages/HomePage.dart';
import 'package:provider/provider.dart';

import 'Providers/AuthProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Broline',
        theme: ThemeData(

          primaryColor: BrolineColor.brolineDarkBlue,
          fontFamily: 'brolineFont',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeController(),
      )));
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthProvider>();

    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (auth.isSigningIn) {
          return Center(
            child:CircularProgressIndicator()
          );
        }
        if (snapshot.hasData) {
          // if user is currently signed in
          return Broline();
        }else{
          return LoginPage();
        }

      }
    );
  }
}
