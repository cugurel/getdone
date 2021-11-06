class Item {
  final String title;
  bool isDone;

  Item({required this.title, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }

  Item.fromMap(Map map)
      : title = map['title'],
        isDone = map['isDone'];

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
