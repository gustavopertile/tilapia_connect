import 'package:flutter/material.dart';
import 'theme_preferences.dart';

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
  }

  set isDark(bool value) {
    _isDark = false;
    _preferences.setTheme(false);
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.cyan[800]!,
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: const Color(0xFF303349),
    primaryColor: Colors.cyan[800]!,
  );
}
