import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier{

  final ThemeData _greenTheme=ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(subtitle1: TextStyle(color:Colors.white),headline3: TextStyle(color: Colors.white)),
  );

  final ThemeData _redTheme=ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    accentColor: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.red),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(subtitle1: TextStyle(color:Colors.white),headline3: TextStyle(color: Colors.white)),
  );

  ThemeData _selectedThemeData = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(subtitle1: TextStyle(color:Colors.white),headline3: TextStyle(color: Colors.white)),
  );

  bool _isGreen = true;

  static SharedPreferences? _sharedPreferences;

  void switchTheme(bool selected){
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  bool get isGreen =>_isGreen;
  ThemeData get selectedThemeData=>_isGreen?_greenTheme:_redTheme;

  Future<void> createProfObject() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value){
    _sharedPreferences!.setBool('themeData', value);
  }

  void laodThemeFromSharedPref(){
    _isGreen = _sharedPreferences!.getBool('themeData')??true;
  }

}