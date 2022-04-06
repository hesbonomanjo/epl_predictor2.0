// as per guidance from https://medium.flutterdevs.com/implement-dark-mode-in-flutter-using-provider-158925112bf9
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const themeStatus = 'THEMESTATUS';

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false;
  }
}

// this class stores the bool value for the dark theme with a getter and setter
// for retrieving and saving