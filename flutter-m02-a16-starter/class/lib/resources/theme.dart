import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_shop/resources/colors.dart';

class PlantShopTheme {
  static final light = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: PlantColors.eucalyptus,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: PlantColors.alto,
      labelStyle: GoogleFonts.lato(fontWeight: FontWeight.w800),
    ),
    cardTheme: const CardTheme(color: PlantColors.linkWater),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: PlantColors.jungleGreen,
      ),
    ),
  );

  static final dark = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(
      const TextTheme(
        headline6: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white70)
      ),
    ),
    scaffoldBackgroundColor: PlantColors.codGray,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      secondary: PlantColors.eucalyptus,
      onSecondary: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: PlantColors.mineShaft,
      labelStyle: GoogleFonts.lato(fontWeight: FontWeight.w800),
    ),
    cardTheme: const CardTheme(color: PlantColors.midGray),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: PlantColors.eucalyptus,
      ),
    ),
  );
}
