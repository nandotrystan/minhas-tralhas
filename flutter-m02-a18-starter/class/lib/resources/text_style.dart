import 'package:flutter/material.dart';
import 'package:pokemon/resources/colors.dart';

class PokemonTextStyles {
  static const applicationTitle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const pokemonName = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const filterTitle =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  static const description =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal);

  static const pokemonNumber = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: PokemonColors.woodsmoke60,
  );

  static const pokemonType = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
