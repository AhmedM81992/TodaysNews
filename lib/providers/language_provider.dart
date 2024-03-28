import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String languageCode = "en";

  void changeLanguage(String langCode) {
    languageCode = langCode;
    //print(languageCode);
    notifyListeners();
  }
}
