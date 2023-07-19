import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeContent {
  static final themeDataLight = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple.shade900,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
  static final themeDataDark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.amber,
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}
