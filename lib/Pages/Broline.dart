import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/Lists.dart';
import 'package:broline/Pages/HomePage.dart';
import 'package:broline/Pages/Profile.dart';
import 'package:broline/Pages/SellProduct.dart';
import 'package:broline/Pages/SubCategoryPage.dart';
import 'package:flutter/material.dart';

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
        icon: Icon(Icons.favorite),
        label: "Favorite",
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.post_add), label: "Sell"),
      BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Message"),
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
        Center(
          child:Text("Soon") ,
        ),
        SellProduct(),
       Center(
         child:Text("Soon") ,
       ),
       Profile()
      ],
    );
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
        elevation: 2.0,
        unselectedIconTheme:
            IconThemeData(color: BrolineColor.brolineDarkYellow),
        unselectedItemColor: BrolineColor.brolineDarkBlue,
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
