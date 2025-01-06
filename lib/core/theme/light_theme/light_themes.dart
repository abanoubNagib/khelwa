import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'light_colors.dart';


ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: LightColorsManager.primary),
  scaffoldBackgroundColor: const Color.fromARGB(204, 243, 246, 242),
  primarySwatch: Colors.orange,
  useMaterial3: true,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: LightColorsManager.primary),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.black,
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    // selectedItemColor: Clrs.defaultColor,
    elevation: 20.0,
  ),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      )),
);
