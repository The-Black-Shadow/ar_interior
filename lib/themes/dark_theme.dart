import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.purple,
  primaryColor: Colors.black87,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    color: Colors.black87,
  ),
  iconTheme: IconThemeData(
    color: Colors.teal.shade700,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.black87,
    secondary: Colors.teal.shade700,
    background: Colors.teal.shade700,
    onPrimary: Colors.teal.shade700,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
    
    
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white60),
    titleSmall: TextStyle(color: Colors.white54),
    displayMedium: TextStyle(color: Colors.black),
  ),
  dividerColor: Colors.grey,
  cardColor: Colors.black87,
  secondaryHeaderColor: Colors.teal.shade700,
);
