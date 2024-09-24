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
    primary: Colors.pink.shade600, // Primary color
    secondary: Colors.pinkAccent.shade200, // Accent with purple tones
    tertiary: Colors.red.shade200, // Accent with red tones
    surface: Colors.pink.shade50, // Soft pink for surfaces like cards

    onPrimary: Colors.white, // Text color on primary (buttons, icons)
    onSecondary:
        Colors.pink.shade800, // Darker pink for text on secondary elements
    error: Colors.redAccent.shade400, // Vibrant red for errors
    onError: Colors.white, // Text color on error background
    onSurface: Colors.pink.shade800, // Dark pink text on surfaces
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.pinkAccent.shade400, // Vibrant floating button
    foregroundColor: Colors.white, // White icon on FAB
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
    circularTrackColor:
        Colors.pink.shade100, // Track color for CircularProgressIndicator
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Colors.pink.shade50, // Light pink tile background
    textColor: Colors.pink.shade900, // Dark pink text for list tiles
    iconColor: Colors.pink.shade600, // Pink icons in list tiles
  ),

  cardTheme: CardTheme(
    color: Colors.pink.shade50, // Card background color
    shadowColor: Colors.pink.shade200, // Card shadow color
    elevation: 5, // Card elevation for a bit of depth
  ),
  dividerTheme: DividerThemeData(
    color: Colors.pink.shade300, // Color for dividers
    thickness: 1, // Divider thickness
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        WidgetStateProperty.all(Colors.pink.shade600), // Checkbox fill color
  ),
  radioTheme: RadioThemeData(
    fillColor:
        WidgetStateProperty.all(Colors.pink.shade600), // Radio button color
  ),
  switchTheme: SwitchThemeData(
    thumbColor:
        WidgetStateProperty.all(Colors.pink.shade600), // Switch thumb color
    trackColor:
        WidgetStateProperty.all(Colors.pink.shade200), // Switch track color
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white, // Dialog background
    titleTextStyle: TextStyle(
      color: Colors.pink.shade800, // Dialog title text color
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: Colors.pink.shade700, // Dialog content text color
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.pink.shade600, // Active tab label color
    unselectedLabelColor: Colors.pink.shade300, // Inactive tab label color
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
            color: Colors.pink.shade600, width: 3), // Tab indicator color
      ),
    ),
  ),
);
