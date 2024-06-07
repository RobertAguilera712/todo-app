import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.red,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          checkboxTheme: CheckboxThemeData(
              side: BorderSide(color: Colors.white, width: 1.2),
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected))
                  return Colors.red[900];
                return Colors.transparent;
              })),
          textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red, shape: CircleBorder()),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: Colors.red.shade900),
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.red.shade900),
              hintStyle: TextStyle(color: Colors.white54),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red.shade900, width: 1.5)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red.shade900)))),
    );
  }
}
