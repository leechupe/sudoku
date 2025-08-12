import 'package:flutter/material.dart';

class AppThemes {
  static final themes = [
    ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
    ),
    ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: Colors.green,
        secondary: Colors.lightGreen,
      ),
      scaffoldBackgroundColor: Colors.green[50],
      appBarTheme: AppBarTheme(backgroundColor: Colors.green),
    ),
    ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
        primary: Colors.orange,
        secondary: Colors.deepOrange,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(backgroundColor: Colors.orange),
    ),
    ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: Colors.purple,
        secondary: Colors.deepPurple,
      ),
      scaffoldBackgroundColor: Colors.purple[50],
      appBarTheme: AppBarTheme(backgroundColor: Colors.purple),
    ),
    ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: Colors.teal,
        secondary: Colors.tealAccent,
      ),
      scaffoldBackgroundColor: Colors.teal[50],
      appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
    ),
  ];
}
