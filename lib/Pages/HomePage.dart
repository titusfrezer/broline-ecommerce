import 'package:broline/Models/Lists.dart';
import 'package:broline/Pages/ProductDetailPage.dart';
import 'package:broline/Pages/SubCategoryPage.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:broline/Models/Colors.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );
  int lastImage = 0;

  @override
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
              backgroundColor: BrolineColor.brolineWhite,
              centerTitle: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    color: Colors.white,
                    child: Carousel(
                      onImageChange: (first, second) {
                        setState(() {
                          lastImage = first;
                        });
                      },
                      boxFit: BoxFit.cover,
                      autoplay: true,
                      animationCurve: Curves.fastOutSlowIn,
                      animationDuration: Duration(seconds: 5),
                      autoplayDuration: Duration(seconds: 10),
                      dotSize: 6.0,
                      dotIncreasedColor: BrolineColor.brolineDarkYellow,
                      dotBgColor: Colors.transparent,
                      dotColor: BrolineColor.brolineLightYellow,
                      dotPosition: DotPosition.bottomCenter,
                      dotVerticalPadding: 10.0,
                      showIndicator: true,
                      indicatorBgPadding: 7.0,
                      images: Lists.imgList
                          .map((item) => Container(
                                child: Center(
                                    child: FadeInImage(
                                  fit: BoxFit.cover,
                                  width: double.maxFinite,
                                  placeholder:
                                      AssetImage("assets/images/laptop.jfif"),
                                  image: NetworkImage(
                                    item,
                                  ),
                                )),
                              ))
                          .toList(),
                    ),
                  ),
                );
              }),
            ),
            innerBoxScrolled == true
                ? SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    sliver: SliverAppBar(
                      floating: false,
                      pinned: true,
                      elevation: 0.0,
                      collapsedHeight: 60,
                      toolbarHeight: 50,
                      automaticallyImplyLeading: false,
                      title: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          color: BrolineColor.brolineLightGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            icon: Icon(
                              Icons.search,
                              color: BrolineColor.brolineDarkYellow,
                            ),
                            hintText: 'Search Product',
                            hintStyle: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      flexibleSpace: Stack(
                        children: <Widget>[
                          Positioned.fill(
                              child: FadeInImage(
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            image: NetworkImage(Lists.imgList[lastImage]),
                            placeholder:
                                AssetImage("assets/images/laptop.jfif"),
                          ))
                        ],
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.all(0),
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
                      "All Products",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
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
                                  color: BrolineColor.brolineBlack,
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
                                    color: BrolineColor.brolineDarkBlue,
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
                                    color: BrolineColor.brolineDarkBlue,
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                "\$350",
                                style: TextStyle(
                                    color: BrolineColor.brolineDarkYellow,
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
      ),
    );
  }

  Widget _buildCategoryList() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          height: 50,
          width: double.maxFinite,
          color: BrolineColor.brolineLightGrey,
          child: Text(
            "Categories",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: BrolineColor.brolineBlack),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 125,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Lists.categoryHorizontalList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SubCategoryPage(
                        categoryName:
                            Lists.categoryHorizontalList[index].categoryName);
                  }));
                },
                child: Container(
                  width: 75,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BrolineColor.brolineDarkYellow,
                              width: 0.75),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(
                            Lists.categoryHorizontalList[index].categoryImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        Lists.categoryHorizontalList[index].categoryName,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: BrolineColor.brolineBlack,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return SubCategoryPage(
                  categoryName: "All Categories",
                  allSubCategory: Lists.allSubCategories,
                );
              }));
            },
            child: Text(
              "See More",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: BrolineColor.brolineLightBlue),
            ),
          ),
        )
      ],
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
            padding: EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Text(
              "Recent Products",
              style: TextStyle(
                  fontSize: 22,
                  color: BrolineColor.brolineBlack,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1.5),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductDetailPage();
                      })),
                      child: Card(
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
                                    color: BrolineColor.brolineBlack,
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
                                      color: BrolineColor.brolineDarkBlue,
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
                                      color: BrolineColor.brolineDarkBlue,
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: Text(
                                  "\$350",
                                  style: TextStyle(
                                      color: BrolineColor.brolineDarkYellow,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              )
                            ],
                          ),
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
