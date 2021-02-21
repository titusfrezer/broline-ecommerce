// import 'package:broline/Models/Colors.dart';
// import 'package:broline/Pages/CategorySubDetail.dart';
// import 'package:flutter/material.dart';
//
// class CategoryAlternative extends StatelessWidget {
//   final String categoryName;
//   CategoryAlternative(this.categoryName);
//
//   Widget buildCheckCategory(BuildContext context) {
//     if (categoryName == "House" || categoryName == "Vehicle") {
//       // return Center(
//       //   child: Row(
//       //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//       //     children: [
//       //       InkWell(
//       //           onTap: (){
//       //             Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
//       //               return CategorySubDetail(categoryName: categoryName,type: "Buy",);
//       //             }));
//       //           },
//       //           child: Text("Buy $categoryName")),
//       //       InkWell(
//       //           onTap:(){
//       //             Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
//       //               return CategorySubDetail(categoryName: categoryName,type: "Rent",);
//       //             }));
//       //           },child: Text("Rent $categoryName"))
//       //     ],
//       //   ),
//       // );
//     } else if (categoryName == "Electronics") {
//       // return ListView(
//       //   children: [
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Computer")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Mobile Phone")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Head Phone")),
//       //
//       //   ],
//       // );
//     } else if (categoryName == "Office and House Holds") {
//       return Center(
//         // child: Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //   children: [
//         //     Text("Office"),
//         //     Text("House")
//         //   ],
//         // ),
//       );
//     } else if (categoryName == "Clothes and Jewelery") {
//       // return ListView(
//       //   children: [
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Cloth")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Shoes")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Watch")),
//       //
//       //   ],
//       // );
//     } else if (categoryName == "Construction Materials") {
//       return Container();
//     } else if (categoryName == "Job") {
//       return Container();
//     } else if (categoryName == "Food and Beverage") {
//       return Container();
//     } else if (categoryName == "Pets") {
//       // return ListView(
//       //   children: [
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Dog")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Cat")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Fish")),
//       //
//       //   ],
//       // );
//     } else if (categoryName == "Entertainment Service") {
//       // ListView(
//       //   children: [
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Restaurant")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Hotel")),
//       //     Container(
//       //         color: BrolineColor.brolineDarkOrange,
//       //         height: 50,
//       //         margin: EdgeInsets.only(bottom: 5),
//       //         child: Text("Club")),
//       //
//       //   ],
//       // );
//     } else if (categoryName == "Drugs") {
//       return Container();
//     }
//       return Container();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: BrolineColor.brolineLightGrey,
//       appBar: AppBar(title: Text(categoryName),
//       ),
//       body: buildCheckCategory(context),
//     );
//   }
// }
