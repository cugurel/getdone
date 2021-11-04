import 'package:flutter/material.dart';
import 'package:getdone/models/item.dart';
import 'package:getdone/models/itemsData.dart';
import 'package:getdone/widgets/item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Center(child: Text("Get It Done")),
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
                  child: ListView.builder(
                    itemCount: Provider.of<ItemsData>(context).items.length,
                    itemBuilder: (context, index) => ItemCard(
                      title: Provider.of<ItemsData>(context).items[index].title,
                      isDone: Provider.of<ItemsData>(context).items[index].isDone,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
