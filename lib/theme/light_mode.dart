import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.pink.shade600, // Vibrant pink primary color
  scaffoldBackgroundColor: Colors.white, // Clean white background
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.pink.shade600, // Vibrant pink app bar
    iconTheme:
        const IconThemeData(color: Colors.white), // White icons in the app bar
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.pink.shade600,
    secondary: Colors.pinkAccent.shade200, // Accent with purple tones
    tertiary: Colors.red.shade200, // Accent with purple tones
    surface: Colors.pink.shade50, // Soft pink for surfaces like cards

    onPrimary: Colors.white, // Text color on primary (buttons, icons)
    onSecondary:
        Colors.pink.shade800, // Darker pink for text on secondary elements
    error: Colors.redAccent.shade400, // Vibrant red for errors
    onError: Colors.white,
    onSurface: Colors.pink.shade800, // Dark pink text on surfaces
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.pinkAccent.shade400, // Vibrant floating button
    foregroundColor: Colors.white,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.pink.shade300, // Button color
    textTheme: ButtonTextTheme.primary, // Primary text color for buttons
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.pink.shade800, // Darker pink for text
        displayColor: Colors.black, // Black for display text
      ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.pink.shade50, // Light pink input background
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
