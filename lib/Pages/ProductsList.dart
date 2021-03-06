import 'package:broline/Models/Colors.dart';
import 'package:broline/Pages/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';

class ProductList extends StatefulWidget {
  final String subCategoryName;
  ProductList(this.subCategoryName);
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool isSterched;
  Widget backArrow;
  Widget search;
  Widget title;
  @override


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
                      color: BrolineColor.brolineLightGrey,
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
                "All Products",
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
               "All Products",
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
     "All Products",
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
                  widget.subCategoryName,
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
                            widget.subCategoryName,
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
                       return InkWell(
                         onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                             return ProductDetailPage();
                           }));
                         },
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
                     },
                   ),
                 ),
               ),

           ],
          ),
        ),
      ),
    );
  }
}
