import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item.dart';

class ItemsData with ChangeNotifier{
  final List<Item> _items=[
    // Item(title: 'Peynir Al'),
    // Item(title: 'Çöpü At'),
    // Item(title: 'Faturayı Öde')

  ];

  static SharedPreferences? _sharedPref;

  List<String> _itemsAsString=[];

  void toggleStatus(int index){
    _items[index].toggleStatus();
    saveItemsToSharedPref(items);
    notifyListeners();
  }

  void itemAdd(String title)
  {
    _items.add(Item(title: title));
    saveItemsToSharedPref(items);
    notifyListeners();
  }

  void itemRemove(int index){
    _items.removeAt(index);
    saveItemsToSharedPref(items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items=>UnmodifiableListView(_items);

  //shared prof metodları
  Future<void> createPrefObject()async{
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Item> items){
    _itemsAsString.clear();
    for(var item in items)
      {
        _itemsAsString.add(json.encode(item.toMap()));
      }
    _sharedPref!.setStringList('toDoData', _itemsAsString);
  }

  void loadItemsFromFromSharedPref(){
    List<String>? tempList = _sharedPref!.getStringList('toDoData')??[];
    _items.clear();

    for(var item in tempList)
      {
        _items.add(Item.fromMap(json.decode(item)));
      }
  }

}
