import 'package:flutter/material.dart';
import 'package:pokemon/blocs/theme_cubit.dart';
import 'package:pokemon/components/gradient_pokeball.dart';
import 'package:pokemon/components/grid_pattern.dart';
import 'package:pokemon/components/type_badge.dart';
import 'package:pokemon/models/domain/pokemon.dart';
import 'package:pokemon/resources/gradients.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/models/enum/pokemon_types.dart';

class PokemonCard extends StatelessWidget {
  static const _horizontalPadding = EdgeInsets.symmetric(horizontal: 20.0);

  const PokemonCard({
    Key? key,
    required this.pokemon,
    // required this.pokemonNumber,
    // required this.pokemonName,
    // required this.pokemonImage,
    // required this.primaryTypeColor,
    // required this.primaryTypeBackgroundColor,
    // required this.primaryTypeIcon,
    // required this.primaryTypeCapitalizedName,
    // required this.hasSecondaryType,
    // required this.secondaryTypeColor,
    // required this.secondaryTypeIcon,
    // required this.secondaryTypeCapitalizedName,
  }) : super(key: key);

  // final String pokemonNumber;
  // final String pokemonName;
  // final String pokemonImage;

  final Pokemon pokemon;

  // Primary Type
  // final Color? primaryTypeColor;
  // final Color? primaryTypeBackgroundColor;
  // final String? primaryTypeIcon;
  // final String? primaryTypeCapitalizedName;

  // // Secondary Type
  // final bool? hasSecondaryType;
  // final Color? secondaryTypeColor;
  // final String? secondaryTypeIcon;
  // final String secondaryTypeCapitalizedName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = context.read<ThemeCubit>().state == ThemeMode.dark;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: _horizontalPadding.copyWith(top: 25.0),
          decoration: BoxDecoration(
            color: pokemon.primaryType.backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: pokemon.primaryType.backgroundColor.withOpacity(0.5),
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pokemon.number, style: theme.textTheme.labelLarge),
                Text(pokemon.name, style: theme.textTheme.headlineSmall),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    TypeBadge(
                      icon: pokemon.primaryType.icon,
                      typeName: pokemon.primaryType.capitalizedName,
                      typeColor: pokemon.primaryType.color,
                    ),
                    if (pokemon.secundaryType != null) ...[
                      const SizedBox(width: 5.0),
                      TypeBadge(
                        icon: pokemon.secundaryType!.icon,
                        typeName: pokemon.secundaryType!.capitalizedName,
                        typeColor: pokemon.secundaryType!.color,
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30.0),
          alignment: AlignmentGeometry.lerp(
            Alignment.topLeft,
            Alignment.topCenter,
            0.68,
          )!,
          child: GradientPattern(gradient: PokemonGradients.vector(isDarkMode)),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.only(top: 25.0, right: 20.0),
          child: ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              heightFactor: 0.85,
              widthFactor: 0.86,
              child: GradientPokeball(
                gradient: PokemonGradients.vector(isDarkMode),
                height: 145,
              ),
            ),
          ),
        ),
        Container(
          height: 130,
          padding: _horizontalPadding.copyWith(right: 25.0),
          alignment: Alignment.topRight,
          child: Image.network(pokemon.image),
        ),
      ],
    );
  }
}
