import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  final String title;
  final bool isDone;

  ItemCard({required this.title,required this.isDone});

  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        title: Text(title,style: TextStyle(color: Colors.black),),
        trailing: Checkbox(
          onChanged: null,
          value: isDone,
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
