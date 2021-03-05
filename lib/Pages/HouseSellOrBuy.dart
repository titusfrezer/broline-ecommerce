import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/DropDownItemsList.dart';
import 'package:broline/Pages/SellForm.dart';
import 'package:flutter/material.dart';

class HouseSellOrBuy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("House"),
          backgroundColor: BrolineColor.brolineDarkBlue,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BrolineColor.brolineDarkYellow,
                              width: 0.75),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(
                            "assets/images/sell.jfif",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Sell",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: 20,
                            color: BrolineColor.brolineBlack,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SellForm("Sell");
                  }));
                },
              ),
              InkWell(
                child: Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BrolineColor.brolineDarkYellow,
                              width: 0.75),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(
                            "assets/images/rent.jfif",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "Rent",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                            color: BrolineColor.brolineBlack,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SellForm("Rent");
                  }));
                },
              ),
            ],
          ),
        ));
  }
}
