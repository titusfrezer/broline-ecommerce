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
      appBar: AppBar(
        title: Text("Select Sub Category"),
        backgroundColor: BrolineColor.brolineDarkBlue,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      SellForm(DropDownItemsList.houseList[index])));
            },
            child: Container(

              width: 100,
              margin: EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 80,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BrolineColor.brolineDarkYellow, width: 0.75),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        Lists.houseList[index].categoryImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      Lists.houseList[index].categoryName,
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
        },
        itemCount: DropDownItemsList.houseList.length,
      ),
    );
  }
}
