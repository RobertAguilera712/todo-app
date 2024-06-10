import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [TodoSchema],
    directory: dir.path,
  );

  runApp(MainApp(
    isar: isar,
  ));
}

class MainApp extends StatelessWidget {
  final Isar isar;

  MainApp({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(isar: isar,),
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
