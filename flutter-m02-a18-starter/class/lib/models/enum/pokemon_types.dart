import 'package:flutter/material.dart';
import 'package:pokemon/resources/colors.dart';
import 'package:pokemon/resources/icons.dart';

enum PokemonType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
}

extension PokemonTypeExtension on PokemonType {
  String get capitalizedName => name[0].toUpperCase() + name.substring(1);

  Color get color {
    switch (this) {
      case PokemonType.normal:
        return PokemonColors.normalType;
      case PokemonType.fighting:
        return PokemonColors.fightingType;
      case PokemonType.flying:
        return PokemonColors.flyingType;
      case PokemonType.poison:
        return PokemonColors.poisonType;
      case PokemonType.ground:
        return PokemonColors.groundType;
      case PokemonType.rock:
        return PokemonColors.rockType;
      case PokemonType.bug:
        return PokemonColors.bugType;
      case PokemonType.ghost:
        return PokemonColors.ghostType;
      case PokemonType.steel:
        return PokemonColors.steelType;
      case PokemonType.fire:
        return PokemonColors.fireType;
      case PokemonType.water:
        return PokemonColors.waterType;
      case PokemonType.grass:
        return PokemonColors.grassType;
      case PokemonType.electric:
        return PokemonColors.electricType;
      case PokemonType.psychic:
        return PokemonColors.psychicType;
      case PokemonType.ice:
        return PokemonColors.iceType;
      case PokemonType.dragon:
        return PokemonColors.dragonType;
      case PokemonType.dark:
        return PokemonColors.darkType;
      case PokemonType.fairy:
        return PokemonColors.fairyType;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case PokemonType.normal:
        return PokemonColors.normalBackground;
      case PokemonType.fighting:
        return PokemonColors.fightingBackground;
      case PokemonType.flying:
        return PokemonColors.flyingBackground;
      case PokemonType.poison:
        return PokemonColors.poisonBackground;
      case PokemonType.ground:
        return PokemonColors.groundBackground;
      case PokemonType.rock:
        return PokemonColors.rockBackground;
      case PokemonType.bug:
        return PokemonColors.bugBackground;
      case PokemonType.ghost:
        return PokemonColors.ghostBackground;
      case PokemonType.steel:
        return PokemonColors.steelBackground;
      case PokemonType.fire:
        return PokemonColors.fireBackground;
      case PokemonType.water:
        return PokemonColors.waterBackground;
      case PokemonType.grass:
        return PokemonColors.grassBackground;
      case PokemonType.electric:
        return PokemonColors.electricBackground;
      case PokemonType.psychic:
        return PokemonColors.psychicBackground;
      case PokemonType.ice:
        return PokemonColors.iceBackground;
      case PokemonType.dragon:
        return PokemonColors.dragonBackground;
      case PokemonType.dark:
        return PokemonColors.darkBackground;
      case PokemonType.fairy:
        return PokemonColors.fairyBackground;
    }
  }

  String get icon {
    switch (this) {
      case PokemonType.normal:
        return PokemonIcons.normal;
      case PokemonType.fighting:
        return PokemonIcons.fighting;
      case PokemonType.flying:
        return PokemonIcons.flying;
      case PokemonType.poison:
        return PokemonIcons.poison;
      case PokemonType.ground:
        return PokemonIcons.ground;
      case PokemonType.rock:
        return PokemonIcons.rock;
      case PokemonType.bug:
        return PokemonIcons.bug;
      case PokemonType.ghost:
        return PokemonIcons.ghost;
      case PokemonType.steel:
        return PokemonIcons.steel;
      case PokemonType.fire:
        return PokemonIcons.fire;
      case PokemonType.water:
        return PokemonIcons.water;
      case PokemonType.grass:
        return PokemonIcons.grass;
      case PokemonType.electric:
        return PokemonIcons.electric;
      case PokemonType.psychic:
        return PokemonIcons.psychic;
      case PokemonType.ice:
        return PokemonIcons.ice;
      case PokemonType.dragon:
        return PokemonIcons.dragon;
      case PokemonType.dark:
        return PokemonIcons.dark;
      case PokemonType.fairy:
        return PokemonIcons.fairy;
    }
  }
}
