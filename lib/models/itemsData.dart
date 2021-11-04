import 'package:flutter/material.dart';

import 'item.dart';

class ItemsData with ChangeNotifier{
  final List<Item> items=[
    Item(title: 'Peynir Al'),
    Item(title: 'Çöpü At'),
    Item(title: 'Faturayı Öde'),
    Item(title: 'Çamaşırı Yıka'),
    Item(title: 'Maçı izle')
  ];
}
