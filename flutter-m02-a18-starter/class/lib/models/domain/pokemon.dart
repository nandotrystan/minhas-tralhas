import 'package:pokemon/models/enum/pokemon_types.dart';

class Pokemon {
  Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.image,
    required this.primaryType,
    this.secundaryType,
  });

  final int id;
  final String number;
  final String name;
  final String image;
  final PokemonType primaryType;
  final PokemonType? secundaryType;

  @override
  String toString() => 'Pokémon $number: $name | type: $primaryType $secundaryType\n';
}
