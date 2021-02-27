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
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              InkWell(
                child: Text("Sell"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return SellForm("Sell");
                  }));
                },
              ),
              InkWell(
                child: Text("Rent"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return SellForm("Rent");
                  }));
                },
              ),
            ],
          ),
        ));
  }
}
