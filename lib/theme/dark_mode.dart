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
    secondary: Colors.pink.shade200, // Light pink for secondary elements
    tertiary: Colors.pink.shade50, // Light pink tertiary accent
    surface: Colors.pink.shade900, // Deep pink surface color

    onPrimary: Colors.white, // White text/icons on primary elements
    onSecondary:
        Colors.pink.shade100, // Lighter pink text on secondary elements
    error: Colors.redAccent.shade400, // Red for errors
    onError: Colors.white, // White text on error background
    onSurface: Colors.pink.shade200, // Light pink text on surfaces
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.pinkAccent.shade400, // Vibrant floating button
    foregroundColor: Colors.white, // White icon on FAB
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.pink.shade500, // Button color in dark mode
    textTheme: ButtonTextTheme.primary, // Primary text color for buttons
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
    circularTrackColor:
        Colors.pink.shade100, // Track color for CircularProgressIndicator
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Colors.pink.shade900, // Dark pink tile background
    textColor: Colors.pink.shade200, // Light pink text for list tiles
    iconColor: Colors.pink.shade600, // Pink icons in list tiles
  ),

  cardTheme: CardTheme(
    color: Colors.pink.shade900, // Card background color in dark mode
    shadowColor: Colors.pink.shade800, // Darker pink shadow
    elevation: 5, // Card elevation for depth
  ),
  dividerTheme: DividerThemeData(
    color: Colors.pink.shade600, // Pink color for dividers
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
    backgroundColor: Colors.black, // Dialog background in dark mode
    titleTextStyle: TextStyle(
      color: Colors.pink.shade100, // Light pink title text in dialog
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: Colors.pink.shade200, // Lighter pink content text
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
