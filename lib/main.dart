import 'package:flutter/material.dart';
import 'package:getdone/models/itemsData.dart';
import 'package:getdone/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'models/color_theme_data.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await ColorThemeData().createProfObject();
  await ItemsData().createPrefObject();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemsData>(
        create: (BuildContext context) => ItemsData()),
    ChangeNotifierProvider<ColorThemeData>(
        create: (BuildContext context) => ColorThemeData())
  ], child: MyApp()));
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Provider.of<ColorThemeData>(context).laodThemeFromSharedPref();
    // Provider.of<ItemsData>(context).loadItemsFromFromSharedPref();
    return Consumer2<ItemsData,ColorThemeData>(
      builder:(context,itemsData,colorThemeData,child) {
        itemsData.loadItemsFromFromSharedPref();
        colorThemeData.laodThemeFromSharedPref();
        return MaterialApp(
          theme: Provider
              .of<ColorThemeData>
            (context)
              .selectedThemeData,
          home: HomePage(),
        );
      }
    );
  }
}

ThemeData greenTheme = ThemeData(
  primaryColor: Colors.green,
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Colors.green,
  accentColor: Colors.green,
  appBarTheme: AppBarTheme(color: Colors.green),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white)),
);

ThemeData redTheme = ThemeData(
  primaryColor: Colors.red,
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: Colors.red,
  accentColor: Colors.red,
  appBarTheme: AppBarTheme(color: Colors.red),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white)),
);

