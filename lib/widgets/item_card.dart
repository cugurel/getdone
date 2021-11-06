import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) toggleStatus;
  final void Function() itemRemove;


  ItemCard({required this.title, required this.isDone,  required this.toggleStatus, required this.itemRemove});

  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: itemRemove,
      key: UniqueKey(),
      child: Card(
        elevation: isDone == true?1:5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          trailing: Checkbox(
            onChanged: toggleStatus,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
