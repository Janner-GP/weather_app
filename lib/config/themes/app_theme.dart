import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() {
    // Define el TextTheme con Google Fonts
    TextTheme textTheme = GoogleFonts.sourceSans3TextTheme(
      const TextTheme(
        titleLarge: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, color: Colors.white),
        titleSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
    );

    return ThemeData(
      textTheme: textTheme,
      colorScheme: const ColorScheme(
        primary: Color.fromARGB(255, 2, 84, 125),
        secondary: Color.fromARGB(255, 23, 220, 191),
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    );
  }
}