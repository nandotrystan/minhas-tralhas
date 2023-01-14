import 'package:flutter/material.dart';

class ListTheme {
  static final light = ThemeData(
    colorScheme: ColorScheme.light(
      primary: const Color(0xFFF3F3F3),
      primaryContainer: Colors.white,
      onPrimary: Color(0xFF494655),
      secondary: const Color(0xFFF81D79),
      tertiary: const Color(0xFF20F836),
      onSecondary: Color(0xffE0E0E0),
    ),
    scaffoldBackgroundColor: Color(0xffE0E0E0),
  );

  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFC48B9F),
      secondary: Color(0xFF82B3C9),
    ),
  );
}