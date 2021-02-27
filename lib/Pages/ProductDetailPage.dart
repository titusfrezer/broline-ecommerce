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
            child: Column(

                children: [

              Container(

                height: 250,


                child: Carousel(

                  boxFit: BoxFit.cover,
                  autoplay: false,
                  dotBgColor: Colors.transparent,
                  dotIncreaseSize: 1,
                  dotVerticalPadding: 5,
                  images: Lists.imgList.map((item) {
                    item = boxImage;
                    return Container(

                      child: FadeInImage(
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        placeholder: AssetImage("assets/images/laptop.jfif"),
                        image: NetworkImage(
                          item,
                        ),
                      ),
                    );
                  }).toList(),
                )
                ),

              Container(
                margin: EdgeInsets.only(top: 20),
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
              Container(
                height: 300,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical:20),
                decoration: BoxDecoration(
                  color: BrolineColor.brolineWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Omen Galaxy S10",
                      style: TextStyle(
                          color: BrolineColor.brolineDarkBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal:25, vertical: 0),
                      trailing: Container(
                        height: 100,
                        width: 60,
                        padding: EdgeInsets.only(left: 20, top: 10, bottom: 5,),
                        decoration: BoxDecoration(
                            color: BrolineColor.brolineDarkBlue,
                            borderRadius: BorderRadius.circular(150)),
                        child: Text(
                          "20% off",
                          maxLines: 2,
                          style: TextStyle(color: BrolineColor.brolineWhite,),
                        ),
                      ),
                      title: Text(
                        "\$300",
                        style: TextStyle(
                            color: BrolineColor.brolineDarkBlue,
                            fontWeight: FontWeight.w700,
                        fontSize: 20),
                      ),
                      subtitle: Text(
                        "\$350",
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough,fontSize: 15),
                      ),
                    )
                  ],
                ),
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
