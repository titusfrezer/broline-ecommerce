import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:broline/Models/Colors.dart';

class SubCategoryPage extends StatefulWidget {
  final String categoryName;

  SubCategoryPage({this.categoryName});

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  bool isSterched;
  Widget backArrow;
  Widget search;
  Widget title;

  Widget _buildSearch(bool innerScrolled) {
    return IconButton(
        icon: Icon(
          Icons.search,
          color: BrolineColor.brolineLightBlue,
        ),
        onPressed: () {
          setState(() {
            if (isSterched == true) {
              title = Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                      color: BrolineColor.brolineLightGrey,
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                      decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: BrolineColor.brolineLightBlue,
                    ),
                    hintText: 'Search Category',
                    hintStyle: TextStyle(fontSize: 18),
                  )));
              isSterched = false;
            } else {
              title = Text(
                widget.categoryName,
                style: TextStyle(color: BrolineColor.brolineDarkBlue),
              );
              isSterched = true;
            }

            print("Yes");
          });
        });
  }

  @override
  void initState() {
    isSterched = false;
    backArrow = IconButton(
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: BrolineColor.brolineDarkBlue,
        ),
        onPressed: () {
          setState(() {
            if (isSterched == true) {
              title = Text(
                widget.categoryName,
                style: TextStyle(color: BrolineColor.brolineDarkBlue),
              );
              isSterched = false;
            } else {
              Navigator.of(context).pop();
            }
          });
        });
    search = _buildSearch(false);
    title = Text(
      widget.categoryName,
      style: TextStyle(color: BrolineColor.brolineDarkBlue),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrolineColor.brolineWhite,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              sliver: SliverAppBar(
                floating: true,
                pinned: true,
                title: innerBoxScrolled == true
                    ? title = Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                            color: BrolineColor.brolineLightGrey,
                            borderRadius: BorderRadius.circular(16)),
                        child: TextFormField(
                            decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: BrolineColor.brolineDarkBlue,
                          ),
                          hintText: 'Search Category',
                          hintStyle: TextStyle(fontSize: 18),
                        )))
                    : isSterched == false
                        ? Text(
                            widget.categoryName,
                            style:
                                TextStyle(color: BrolineColor.brolineDarkBlue),
                          )
                        : Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            decoration: BoxDecoration(
                                color: BrolineColor.brolineLightGrey,
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                                decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: BrolineColor.brolineDarkBlue,
                              ),
                              hintText: 'Search Category',
                              hintStyle: TextStyle(fontSize: 18),
                            ))),
                elevation: 0.0,
                actions: [
                  innerBoxScrolled == true
                      ? SizedBox()
                      : isSterched == true
                          ? SizedBox()
                          : _buildSearch(false)
                ],
                backgroundColor: BrolineColor.brolineWhite,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: BrolineColor.brolineDarkBlue,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isSterched == true) {
                          title = Text(
                            widget.categoryName,
                            style:
                                TextStyle(color: BrolineColor.brolineDarkBlue),
                          );
                          isSterched = false;
                        } else {
                          Navigator.of(context).pop();
                        }
                      });
                    }),
              ),
            ),

          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: 150,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: BrolineColor.brolineDarkBlue,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/images/laptop.jfif'),
                            fit: BoxFit.cover,
                          )),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          "Electronics",
                          style: TextStyle(
                              color: BrolineColor.brolineWhite,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
