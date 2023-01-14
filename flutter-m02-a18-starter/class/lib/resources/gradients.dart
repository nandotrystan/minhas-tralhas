import 'package:flutter/material.dart';
import 'package:pokemon/resources/colors.dart';

class PokemonGradients {
  static pokeball(bool isDarkMode) {
    final startColor =
        isDarkMode ? Colors.grey[900]!.withOpacity(0.3) : PokemonColors.gallery;
    final endColor =
        isDarkMode ? Colors.grey[850]!.withOpacity(0.9) : Colors.white;

    return LinearGradient(
      colors: [
        startColor,
        endColor,
      ],
      begin: Alignment.center,
      end: Alignment.bottomCenter,
    );
  }

  static vector(bool isDarkMode) {
    final baseColor = isDarkMode ? Colors.black : Colors.white;
    return LinearGradient(
      colors: [
        baseColor.withOpacity(0.3),
        baseColor.withOpacity(0.0),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
