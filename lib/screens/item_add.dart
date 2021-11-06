import 'package:flutter/material.dart';
import 'package:getdone/models/itemsData.dart';
import 'package:provider/provider.dart';

class ItemAdd extends StatelessWidget {

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.yellow.shade50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                    TextField(
                    minLines: 1,
                    maxLines: 3,
                    cursorHeight: 12,
                    controller: textController,
                    onChanged: (input){
                      print(textController.text);
                    },
                    style: TextStyle(color:Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add Item',
                      hintText: '....',
                    ),
                    autofocus: true,
                  ),

                FlatButton(
                    onPressed: () {
                      Provider.of<ItemsData>(context,listen: false).itemAdd(textController.text);
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).accentColor,
                    child: Text('ADD'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
