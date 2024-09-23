import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.pink.shade700, // Vibrant pink for primary elements
  scaffoldBackgroundColor: Colors.black, // Deep black background
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.pink.shade700, // Pink app bar in dark mode
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.pink.shade700,
    secondary: Colors.pink.shade200, // Teal accent for contrast
    tertiary: Colors.pink.shade50, // Teal accent for contrast
    surface: Colors.pink.shade900, // Deep pink surface color
    // Darker pink background
    onPrimary: Colors.white,
    onSecondary: Colors.pink.shade100, // Light pink for text on teal
    error: Colors.redAccent.shade400,
    onError: Colors.white,
    onSurface: Colors.pink.shade200, // Light pink text on surfaces
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.pinkAccent.shade400, // Vibrant floating button
    foregroundColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.pink.shade500, // Button color in dark mode
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.pink.shade200, // Light pink for body text
        displayColor: Colors.white, // White for display text
      ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.pink.shade900, // Dark pink input background
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink.shade600, width: 2),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.pink.shade600, // Primary color for CircularProgressIndicator
    circularTrackColor: Colors.pink.shade100, // Track color for CircularProgressIndicator
  ),
);
