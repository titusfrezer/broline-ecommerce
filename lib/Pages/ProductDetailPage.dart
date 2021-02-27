import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/Lists.dart';
import 'package:carousel_pro/carousel_pro.dart';
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
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: BrolineColor.brolineDarkGrey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: BrolineColor.brolineLightGrey,
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: BrolineColor.brolineWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: false,
                dotBgColor: Colors.transparent,

                images: Lists.imgList
                    .map((item) {
                      item = boxImage;
                      return Container(
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
                      );
                } )
                    .toList(),
              ),
            ),
          ),

          Container(
            height: 70,
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
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: BrolineColor.brolineWhite,
          //         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          //         image: DecorationImage(
          //             image: NetworkImage(Lists.imgList[0])
          //         )
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildImageBox(String imgUrl) {
    return InkWell(
      onTap: (){
        setState(() {
          boxImage = imgUrl;
        });

      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: BrolineColor.brolineDarkOrange,
            borderRadius: BorderRadius.circular(15),
            image:
                DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
