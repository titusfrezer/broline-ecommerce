import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/Lists.dart';
import 'package:broline/Pages/HouseCategoryPage.dart';
import 'package:broline/Pages/SellForm.dart';



class SellProduct extends StatefulWidget {
  @override
  _SellProductState createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrolineColor.brolineDarkBlue,
        title: Text(
          "Pick Category",
          style: TextStyle(color: BrolineColor.brolineWhite),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (Lists.categoryList[index].categoryName == "House") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return HouseCategoryPage();
                  }));
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SellForm(Lists.categoryList[index].categoryName);
                  }));
                }
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 2.5),
                height: 100,
                width: double.maxFinite,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                        child: Container(),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            Lists.categoryList[index].categoryImage,
                          ),
                          fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken)
                        ))),
                    ClipRRect(
                        child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Text(
                          Lists.categoryList[index].categoryName,
                          style: TextStyle(
                              color: BrolineColor.brolineWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            );
          },
          itemCount: Lists.categoryList.length),
    );
  }

// String selectedButtonValue;
// String hint = "Select Category";
// final List<DropdownMenuItem<String>> dropDownMenuItems = DropDownItems.items
//     .map((String value) => DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         ))
//     .toList();
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       backgroundColor: BrolineColor.brolineWhite,
//       title: Text(
//         "Sell Product",
//         style: TextStyle(color: BrolineColor.brolineDarkGrey),
//       ),
//     ),
//     body: Column(
//       children: [
//         _buildCategoryList(),
//         hint != "Select Category"
//             ? Expanded(child: _buildListView())
//             : Container(
//                 margin: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.25),
//                 child: Text("Select Category First")),
//       ],
//     ),
//   );
// }
//
// Widget _buildCategoryList() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     child: DropdownButton(
//       isExpanded: true,
//       value: selectedButtonValue,
//       hint: Text(hint),
//       items: dropDownMenuItems,
//       onChanged: (String value) {
//         setState(() {
//           selectedButtonValue = value;
//           Entry(selectedButtonValue);
//           hint = value;
//         });
//       },
//     ),
//   );
// }
//
// Widget _buildListView() {
//   List<Entry> dataEntry;
//
//   if(selectedButtonValue == "House"){
//     dataEntry = Entry.houseSell;
//   }else if(selectedButtonValue == "Vehicle"){
//     dataEntry = Entry.houseRent;
//   }
//   return ListView.builder(
//     itemBuilder: (BuildContext context, int index) =>
//         EntryItem(dataEntry[index]),
//     itemCount: dataEntry.length,
//   );
// }

}

// One entry in the multilevel list displayed by this app.

// Data to display.

// class EntryItem extends StatelessWidget {
//   const EntryItem(this.entry);
//
//   final Entry entry;
//
//   Widget _buildTiles(Entry root) {
//     if (root.children.isEmpty)
//       return Container(
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         height: 50,
//         width: double.maxFinite,
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
//         decoration: BoxDecoration(
//           color: BrolineColor.brolineLightGrey,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: TextFormField(
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             errorBorder: InputBorder.none,
//             disabledBorder: InputBorder.none,
//           ),
//         ),
//       );
//     return ExpansionTile(
//       // key: PageStorageKey<Entry>(root),
//       title: Text(root.title),
//
//       children: root.children.map(_buildTiles).toList(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(entry);
//   }
// }
