import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/theme/dark_mode.dart';
import 'package:minimal_social_media_app/theme/light_mode.dart'; 

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkModeEnabled => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
