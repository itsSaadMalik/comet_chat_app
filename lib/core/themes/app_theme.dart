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
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 23, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        padding: WidgetStatePropertyAll(
          EdgeInsets.only(top: 15, bottom: 15, left: 0),
        ),
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 221, 221, 221),
        ),
        fixedSize: WidgetStatePropertyAll(Size(300, 70)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
      ),
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
