import 'package:broline/Models/Lists.dart';
import 'package:broline/Pages/ProductDetailPage.dart';
import 'package:broline/Pages/ProductsList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:broline/Models/MyCategory.dart';

import 'package:broline/Models/Colors.dart';

class SubCategoryPage extends StatefulWidget {
  final String categoryName;
  final List<MyCategory> allSubCategory;

  SubCategoryPage({this.categoryName, this.allSubCategory});

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  bool isSterched;
  Widget backArrow;
  Widget search;
  Widget title;
  List<MyCategory> subCategory;

  void _buildGrid() {
    if (widget.categoryName == "House") {
      subCategory = Lists.houseList;
    } else if (widget.categoryName == "Electronics") {
      subCategory = Lists.electronicsList;
    } else if (widget.categoryName == "Clothes and Jewelery") {
      subCategory = Lists.clothList;
    } else if (widget.categoryName == "Entertainment") {
      subCategory = Lists.entertainmentList;
    } else if (widget.categoryName == "Pets") {
      subCategory = Lists.petsList;
    } else if (widget.categoryName == "Drugs") {
      subCategory = Lists.drugList;
    } else if (widget.categoryName == "Vehicle") {
      subCategory = Lists.vehicleList;
    } else if (widget.categoryName == "All Categories") {
      subCategory = widget.allSubCategory;
    } else {
      subCategory = Lists.houseList;
    }
  }

  Widget _buildSearch(bool innerScrolled) {
    return IconButton(
        icon: Icon(
          Icons.search,
          color: BrolineColor.brolineDarkYellow,
        ),
        onPressed: () {
          setState(() {
            if (isSterched == true) {
              title = Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                      color: BrolineColor.brolineWhite,
                      borderRadius: BorderRadius.circular(16)),
                  child: TextFormField(
                      decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: BrolineColor.brolineDarkYellow,
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
    _buildGrid();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: BrolineColor.brolineWhite,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            print(innerBoxScrolled);
            return <Widget>[
              SliverAppBar(
                leadingWidth: 30,
                collapsedHeight: 60,
                toolbarHeight: 55,
                floating: true,
                pinned: true,
                title: innerBoxScrolled == true
                    ? title = Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                            color: BrolineColor.brolineWhite,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                            decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: BrolineColor.brolineDarkYellow,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search Category',
                          hintStyle: TextStyle(fontSize: 18),
                        )))
                    : isSterched == false
                        ? Text(
                            widget.categoryName,
                            style: TextStyle(color: BrolineColor.brolineWhite),
                          )
                        : Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 3),
                            decoration: BoxDecoration(
                                color: BrolineColor.brolineWhite,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextFormField(
                                decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: BrolineColor.brolineDarkYellow,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
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
                backgroundColor: innerBoxScrolled == true
                    ? BrolineColor.brolineWhite
                    : isSterched == true
                        ? BrolineColor.brolineWhite
                        : BrolineColor.brolineDarkBlue,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: innerBoxScrolled == true
                          ? BrolineColor.brolineDarkBlue
                          : isSterched == true
                              ? BrolineColor.brolineDarkBlue
                              : BrolineColor.brolineWhite,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isSterched == true && innerBoxScrolled == true) {
                          Navigator.of(context).pop();
                        } else if (isSterched == true) {
                          title = Text(
                            widget.categoryName,
                            style: TextStyle(color: BrolineColor.brolineWhite),
                          );
                          isSterched = false;
                        } else {
                          Navigator.of(context).pop();
                        }
                      });
                    }),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductList(subCategory[index].categoryName);
                      }));
                    },
                    child: Container(
                      width: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: BrolineColor.brolineDarkYellow,
                                  width: 0.75),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(
                                subCategory[index].categoryImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              subCategory[index].categoryName,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: BrolineColor.brolineBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }, childCount: subCategory.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
