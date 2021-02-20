import 'package:broline/Pages/SellProduct.dart';

class Entry {
  const Entry(
      [this.title, this.children = const <Entry>[], this.selectedButton]);

  final String title;
  final String selectedButton;
  final List<Entry> children;

  static const List<Entry> houseSell = <Entry>[

    Entry('Product Information',
        <Entry>[Entry('Product Name'), Entry('Section A2')]),
    Entry(
      'Chapter B',
      <Entry>[
        Entry('Section B0'),
        Entry('Section B1'),
      ],
    ),
  ];
  static const List<Entry> houseRent = <Entry>[
    Entry(
      'Pro Info',
      <Entry>[
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
}
