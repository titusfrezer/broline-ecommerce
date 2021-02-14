import 'dart:ffi';

import 'package:broline/Pages/SubCategoryPage.dart';
import 'package:flutter/material.dart';

import 'package:broline/Models/Colors.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';

class HomePage extends StatelessWidget {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BrolineColor.brolineWhite,
        body: NestedScrollView(
          scrollDirection: Axis.vertical,
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              SliverPadding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                sliver: SliverAppBar(
                  floating: false,
                  elevation: 0.0,
                  forceElevated: false,
                  expandedHeight: 100,
                  backgroundColor: BrolineColor.brolineWhite,
                  centerTitle: true,
                  leading: Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: BrolineColor.brolineLightGrey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.list,
                          color: BrolineColor.brolineDarkGrey,
                          size: 25,
                        ),
                        onPressed: () {}),
                  ),
                  actions: [
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: BrolineColor.brolineLightGrey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: BrolineColor.brolineDarkGrey,
                            size: 25,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        color: Colors.white,
                        child: Image.asset(
                          'assets/images/brolineSplashCroped.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20),
                sliver: SliverAppBar(
                  floating: true,
                  pinned: true,
                  elevation: 0.0,
                  forceElevated: false,
                  backgroundColor: BrolineColor.brolineWhite,
                  title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    decoration: BoxDecoration(
                        color: BrolineColor.brolineLightGrey,
                        borderRadius: BorderRadius.circular(16)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: BrolineColor.brolineDarkGrey,
                        ),
                        hintText: 'Search Product',
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildCategoryList(),
                    _buildRecentProducts(),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 50),
                      child: Text(
                        "Recent Products",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              // Replace your ListView.builder with this:
              SliverGroupBuilder(
                margin: EdgeInsets.only(left: 10, right: 10, top: 25),
                child: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Card(
                        color: BrolineColor.brolineWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Image.asset(
                                  "assets/images/broline.jfif",
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                              ),
                              Text(
                                "Omen Galaxy S10",
                                style: TextStyle(
                                    color: BrolineColor.brolineDarkGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                trailing: Container(
                                  width: 55,
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: BrolineColor.brolineDarkOrange,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.elliptical(50, 35),
                                          bottomLeft: Radius.circular(100))),
                                  child: Text(
                                    "20% off",
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: BrolineColor.brolineWhite),
                                  ),
                                ),
                                title: Text(
                                  "\$300",
                                  style: TextStyle(
                                      color: BrolineColor.brolineDarkOrange,
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: Text(
                                  "\$350",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildCategoryList() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return SubCategoryPage(categoryName: "SubCategory",);
                    }));
                  },
                  child: Card(
                    color: BrolineColor.brolineLightOrange,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: BrolineColor.brolineDarkOrange, width: 0.25),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Container(
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.category,
                            color: BrolineColor.brolineDarkOrange,
                          ),
                          Text(
                            "Category",
                            style: TextStyle(
                                color: BrolineColor.brolineDarkOrange,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              onPressed: () {},
              child: Text("See More"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecentProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 350,
      decoration: BoxDecoration(
          color: BrolineColor.brolineLightGrey,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              "Recent Products",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.75,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: BrolineColor.brolineWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Image.asset(
                                "assets/images/broline.jfif",
                                fit: BoxFit.cover,
                                height: 100,
                              ),
                            ),
                            Text(
                              "Omen Galaxy S10",
                              style: TextStyle(
                                  color: BrolineColor.brolineDarkGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              trailing: Container(
                                width: 55,
                                padding: EdgeInsets.only(
                                    left: 20, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: BrolineColor.brolineDarkOrange,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.elliptical(50, 35),
                                        bottomLeft: Radius.circular(100))),
                                child: Text(
                                  "20% off",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: BrolineColor.brolineWhite),
                                ),
                              ),
                              title: Text(
                                "\$300",
                                style: TextStyle(
                                    color: BrolineColor.brolineDarkOrange,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                "\$350",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
