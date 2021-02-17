import 'package:broline/Models/Colors.dart';
import 'package:flutter/material.dart';

class SellProduct extends StatelessWidget {
  SellProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrolineColor.brolineWhite,
        title: Text("Sell Product",style: TextStyle(color: BrolineColor.brolineDarkGrey),),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}
// One entry in the multilevel list displayed by this app.
class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      height: 50,
      width: double.maxFinite,

      padding:
      EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: BrolineColor.brolineLightGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child:  TextFormField(

        decoration: InputDecoration(

          border:InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,


        ),
      ),
    );
    return ExpansionTile(

      // key: PageStorageKey<Entry>(root),
      title: Text(root.title),

      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
