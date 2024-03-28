import 'package:flutter/material.dart';

class MyThemeDataProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;


  void changeTheme(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}