import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/Lists.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrolineColor.brolineWhite,
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        floatHeaderSlivers: false,
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          print(innerBoxScrolled);
          return <Widget>[
            SliverAppBar(
              elevation: 0.0,
              expandedHeight: 200,
              toolbarHeight: 0,
              backgroundColor: BrolineColor.brolineWhite,
              centerTitle: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: UserAccountsDrawerHeader(
                    decoration:
                        BoxDecoration(color: BrolineColor.brolineDarkBlue),
                    currentAccountPicture: CircleAvatar(
                      foregroundColor: BrolineColor.brolineDarkYellow,
                      backgroundColor: BrolineColor.brolineBlack,
                      child: Text("B", style: TextStyle(fontSize: 20)),
                    ),
                    accountName: Text(
                      "Broline",
                      style: TextStyle(fontSize: 18),
                    ),
                    accountEmail: Text("broline@ecommerce.com"),
                  ),
                );
              }),
            ),
            innerBoxScrolled == true
                ? SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    sliver: SliverAppBar(
                      backgroundColor: BrolineColor.brolineDarkBlue,
                      floating: false,
                      pinned: true,
                      elevation: 0.0,
                      automaticallyImplyLeading: false,
                      title: Text("Profile"),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.all(0),
                  ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: _buildWidgetList),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWidgetList = [
    InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Icon(
            Icons.post_add,
            size: 25,
          ),
          title: Text(
            "My Post",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    ),
    InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Icon(
            Icons.shopping_cart,
            size: 25,
          ),
          title: Text(
            "My Cart",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    ),
    InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Icon(
            Icons.settings,
            size: 25,
          ),
          title: Text(
            "Setting",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    ),
    InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Icon(
            Icons.language,
            size: 25,
          ),
          title: Text(
            "Language",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    ),
    InkWell(
      onTap: () {
        FirebaseAuth.instance.signOut();
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Icon(
            Icons.login_outlined,
            size: 25,
          ),
          title: Text(
            "LogOut",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    )
  ];
}
