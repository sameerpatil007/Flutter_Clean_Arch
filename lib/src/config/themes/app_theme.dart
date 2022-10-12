import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.green,
        secondary: Colors.black,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
      ),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Colors.green)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.green)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black, side: const BorderSide(color: Colors.black))),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      cardColor: Colors.black,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.greenAccent, secondary: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white10,
        helperStyle: TextStyle(color: Colors.white70),
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white70),
        floatingLabelStyle: TextStyle(color: Colors.greenAccent),
      ),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Colors.greenAccent)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.greenAccent)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white70, side: const BorderSide(color: Colors.white70))),
    );
  }
}
