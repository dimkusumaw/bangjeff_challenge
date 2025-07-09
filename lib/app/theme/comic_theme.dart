import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData comicTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.permanentMarker(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        shadows: [
          Shadow(
            offset: Offset(2, 2),
            blurRadius: 0,
            color: Colors.grey,
          ),
        ],
      ),
    ),
    toolbarHeight: 64,
  ),
  colorScheme: const ColorScheme.light().copyWith(
    surface: Colors.white,
    onSurface: Colors.black,
    primary: Colors.black,
    secondary: Colors.grey,
  ),
  textTheme: GoogleFonts.permanentMarkerTextTheme(
    const TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
  ),
  cardColor: Colors.white,
  dividerColor: Colors.black26,
);