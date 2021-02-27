import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/DropDownItemsList.dart';
import 'package:broline/Models/Lists.dart';
import 'package:broline/Pages/HouseSellOrBuy.dart';
import 'package:broline/Pages/SellForm.dart';
import 'package:flutter/material.dart';

class HouseCategoryPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Sub Category"),),
      body: ListView.builder(itemBuilder: (BuildContext context,int index){
        return InkWell(
          onTap: () {
            if(DropDownItemsList.houseList[index] == "House"){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> HouseSellOrBuy()));

            }else
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> SellForm(DropDownItemsList.houseList[index])));

          },
          child: Container(
              color: BrolineColor.brolineDarkBlue,
              height: 50,
              margin: EdgeInsets.only(bottom: 5),
              child: Text(DropDownItemsList.houseList[index])),
        );
      },itemCount: DropDownItemsList.houseList.length,),
    );
  }
}

