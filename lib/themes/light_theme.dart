import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  primaryColor: Colors.deepPurple,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.deepPurple,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.deepPurple,
    secondary: Colors.white,
    background: Colors.white,
    surface: Colors.deepPurple[100]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.black87,
    onSurface: Colors.deepPurple[200]!,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black87),
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.black54),
    titleSmall: TextStyle(color: Colors.black38),
    displayMedium: TextStyle(color: Colors.black),
  ),
  dividerColor: Colors.grey[300],
  cardColor: Colors.deepPurple,
  secondaryHeaderColor: Colors.white,
);
