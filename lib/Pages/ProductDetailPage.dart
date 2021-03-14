import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/Lists.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String boxImage = Lists.imgList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrolineColor.brolineLightGrey,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Product Detail"),
        backgroundColor: BrolineColor.brolineDarkBlue,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              Container(
                height: 200,
                child: FadeInImage(
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  placeholder: AssetImage("assets/images/laptop.jfif"),
                  image: NetworkImage(
                    boxImage,
                  ),
                ),
              ),
              Container(
                color: BrolineColor.brolineWhite,
                padding: EdgeInsets.only(top: 20, bottom: 20),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildImageBox(Lists.imgList[0]),
                    SizedBox(
                      width: 20,
                    ),
                    _buildImageBox(Lists.imgList[1]),
                    SizedBox(
                      width: 20,
                    ),
                    _buildImageBox(Lists.imgList[2])
                  ],
                ),
              ),
              Container(
                height: 250,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: BrolineColor.brolineWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Omen Galaxy S10",
                      style: TextStyle(
                          color: BrolineColor.brolineBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      trailing: Container(
                        height: 100,
                        width: 60,
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                            color: BrolineColor.brolineDarkBlue,
                            borderRadius: BorderRadius.circular(150)),
                        child: Text(
                          "20% off",
                          maxLines: 2,
                          style: TextStyle(
                            color: BrolineColor.brolineWhite,
                          ),
                        ),
                      ),
                      title: Text(
                        "300 Birr",
                        style: TextStyle(
                            color: BrolineColor.brolineDarkBlue,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        "350 Birr",
                        style: TextStyle(
                          color: BrolineColor.brolineDarkYellow,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: BrolineColor.brolineWhite,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                child: Text(
                  "Description ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        color: BrolineColor.brolineDarkBlue,
                        textColor: BrolineColor.brolineWhite,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.call),
                            Text(
                              "Call",
                              style: TextStyle(
                                  color: BrolineColor.brolineWhite,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        // shape: RoundedRectangleBorder(side: BorderSide(color: BrolineColor.brolineDarkBlue,width: 0.25)),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        color: BrolineColor.brolineWhite,
                        textColor: BrolineColor.brolineBlack,

                        onPressed: () {},
                        child: Icon(Icons.message),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildImageBox(String imgUrl) {
    return InkWell(
      onTap: () {
        setState(() {
          boxImage = imgUrl;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: BrolineColor.brolineDarkBlue,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
