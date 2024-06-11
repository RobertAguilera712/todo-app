import 'package:flutter/material.dart';

class Constants {
  static ThemeData mainTheme = ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.red,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: Colors.white, width: 1.2),
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return Colors.red[900];
            return Colors.transparent;
          })),
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.red, shape: CircleBorder()),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: Colors.red.shade900),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.red.shade900),
          hintStyle: const TextStyle(color: Colors.white54),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900))));
}
