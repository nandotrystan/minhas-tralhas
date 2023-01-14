import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/resources/text_style.dart';

class PokemonTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.interTextTheme(_lightTextTheme),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.black,
    ),
  );

  static final dark = ThemeData(
    textTheme: GoogleFonts.interTextTheme(_darkTextTheme),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      onSecondary: Colors.white,
    ),
  );

  static const _lightTextTheme = TextTheme(
    headlineMedium: PokemonTextStyles.applicationTitle,
    headlineSmall: PokemonTextStyles.pokemonName,
    titleMedium: PokemonTextStyles.filterTitle,
    bodyLarge: PokemonTextStyles.description,
    labelLarge: PokemonTextStyles.pokemonNumber,
    labelMedium: PokemonTextStyles.pokemonType,
  );

  static final _darkTextTheme = TextTheme(
    headlineMedium: PokemonTextStyles.applicationTitle.copyWith(
      color: Colors.white,
    ),
    headlineSmall: PokemonTextStyles.pokemonName,
    titleMedium: PokemonTextStyles.filterTitle,
    bodyLarge: PokemonTextStyles.description,
    labelLarge: PokemonTextStyles.pokemonNumber,
    labelMedium: PokemonTextStyles.pokemonType,
  );
}
