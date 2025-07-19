import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  TextTheme textTheme = TextTheme();
  static ThemeData get appLightTheme => ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 17, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 23, color: Colors.black),
    ),
  );
  static ThemeData get appDarkTheme => ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
    ),
  );
}
