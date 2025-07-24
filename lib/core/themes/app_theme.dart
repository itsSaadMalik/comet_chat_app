import 'package:comet_chat_app/core/themes/app_colors.dart';
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
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey,
        systemNavigationBarColor: Colors.grey,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 13, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 23, color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        padding: WidgetStatePropertyAll(
          EdgeInsets.only(top: 15, bottom: 15, left: 0),
        ),
        backgroundColor: WidgetStatePropertyAll(
          const Color.fromARGB(255, 154, 180, 197),
        ),
        fixedSize: WidgetStatePropertyAll(Size(300, 70)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),
        ),
        elevation: WidgetStatePropertyAll(0),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.appPrimaryColor,
      foregroundColor: Colors.black,
    ),
  );
  static ThemeData get appDarkTheme => ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: appLightTheme.elevatedButtonTheme.style,
    ),
  );
}
