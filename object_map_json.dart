import 'dart:convert';

main(){
  Item itemObject = Item(title: 'Uyu',isDone: true);
  print('item object: $itemObject');
  print('item object type: ${itemObject.runtimeType}');

  Map itemAsMap = itemObject.toMap();
  print('item object: $itemAsMap');
  print('item object type: ${itemAsMap.runtimeType}');

  String itemAsJson = json.encode(itemAsMap);
  print('item object: $itemAsJson');
  print('item object type: ${itemAsJson.runtimeType}');

  itemAsMap = json.decode(itemAsJson);
  //itemObject = Item(title: itemAsMap['title'],isDone: itemAsMap['isDone']);
  itemObject=Item.fromMap(itemAsMap);
  print(itemObject);
}

class Item{
  String title;
  bool isDone;

  Item({required this.title,required this.isDone});
  Item.fromMap(Map map):title=map['title'],isDone=map['isDone'];

  Map<String,dynamic>toMap() => {'title':title, 'isDone':isDone};
}