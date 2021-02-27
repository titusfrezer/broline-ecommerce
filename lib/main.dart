import 'package:broline/Models/Colors.dart';
import 'package:broline/Pages/SellProduct.dart';
import 'package:broline/Pages/SubCategoryPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:broline/Pages/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Broline(),
  ));
}

class Broline extends StatefulWidget {
  Broline({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BrolineState createState() => _BrolineState();
}

class _BrolineState extends State<Broline> {
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline_rounded),
        label: "Favorite",
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined), label: "Sell"),
      BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomePage(),
        SubCategoryPage(
          categoryName: "",
        ),
        SellProduct(),
        SubCategoryPage(
          categoryName: "",
        ),
        HomePage(),
      ],
    );
  }

  void _incrementCounter() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: 'titofrezer2019@gmail.com',
        password: '123titus',
      );
    } catch (e) {
      print(e);
    }
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: BrolineColor.brolineDarkYellow,
        selectedItemColor: BrolineColor.brolineDarkBlue,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}
