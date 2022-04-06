import 'package:epl_predictor/src/utilities/darkTheme/dark_theme_preference.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}

//we are accessing the preference value through provider so if there is a 
//change then notifyListeners() will be updated wherever we have attached the
//provider to the screen.
