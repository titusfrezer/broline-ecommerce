import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/Lists.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetailPage extends StatelessWidget {
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
              image: DecorationImage(
                 image: NetworkImage(Lists.imgList[0])
              )
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container()
          ),

          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageBox(Lists.imgList[0]),
                SizedBox(width: 20,),
                _buildImageBox(Lists.imgList[1]),
                SizedBox(width: 20,),
                _buildImageBox(Lists.imgList[2])
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: BrolineColor.brolineWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(Lists.imgList[0])
                  )
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageBox(String imgUrl) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: BrolineColor.brolineDarkOrange,
          borderRadius: BorderRadius.circular(15),
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover)),
    );
  }
}
