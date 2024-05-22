import 'package:flutter/material.dart';
import 'package:tilapia_connect/theme/theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  ThemePreferences _preferences = ThemePreferences();
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  getPreferences() {
    _isDark = false;
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFFe56b59),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: const Color(0xFF303349),
    primaryColor: const Color(0xFFe56b59),
  );
}
