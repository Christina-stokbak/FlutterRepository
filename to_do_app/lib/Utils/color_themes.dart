import 'package:flutter/material.dart';

class ThemeColors {
  static Color appBarColor = const Color(0xFF01553D);
}

class MyThemes {
  static ThemeData myDarkTheme = ThemeData(
    useMaterial3: true,
    // colorScheme: ThemeData.dark().colorScheme,
    // primaryColor: ThemeData.dark().primaryColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: ThemeColors.appBarColor),
  );

  static ThemeData get MyDarkTheme{
    return myDarkTheme;
  }
}
