import 'package:flutter/material.dart';
import 'package:getdone/models/itemsData.dart';
import 'package:getdone/screens/settings.dart';
import 'package:getdone/widgets/item_card.dart';
import 'package:provider/provider.dart';

import 'item_add.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(icon:Icon(Icons.settings,size: 25,), onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Settings()));
          },),
        )],
        title: Center(
          child: Text("Get It Done"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${Provider.of<ItemsData>(context).items.length} Items",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Consumer<ItemsData>(builder: (context,itemsData,child)=>Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: itemsData.items.length,
                      itemBuilder: (context, index) => ItemCard(
                        title: itemsData.items[index].title,
                        isDone:
                        itemsData.items[index].isDone,
                        toggleStatus: (_) {
                          Provider.of<ItemsData>(context, listen: false)
                              .toggleStatus(index);
                        },
                        itemRemove: () {
                          Provider.of<ItemsData>(context, listen: false)
                              .itemRemove(index);
                        },
                      ),
                    ),
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              context: context,
              builder: (context) => ItemAdd());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
