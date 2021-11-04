import 'package:flutter/material.dart';
import 'package:getdone/models/itemsData.dart';
import 'package:getdone/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider<ItemsData>(create:(BuildContext context)=>ItemsData(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green,
        accentColor: Colors.green,
        appBarTheme: AppBarTheme(color: Colors.green),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(subtitle1: TextStyle(color:Colors.white),headline3: TextStyle(color: Colors.white)),
      ),
      home: HomePage(),
    );
  }
}

