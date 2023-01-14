import 'package:pokemon/clients/poke_api_client.dart';
import 'package:pokemon/models/dto/pokemon_dto.dart';
import 'package:pokemon/models/enum/pokemon_types.dart';

import '../models/domain/pokemon.dart';

class PokemonRepository {
  static const _baseImageUrl =
      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/';
  const PokemonRepository(this._pokeApiClient);

  final PokeApiClient _pokeApiClient;

  Future<List<Pokemon>> getPokemons({required int page}) async {
    final offSet = (page - 1) * 20;
    final pokemonListDto = await _pokeApiClient.getPokemonList(offSet: offSet);
    final pokemons = <Pokemon>[];

    for (final pokemonListResult in pokemonListDto.results!) {
      final pokemonName = pokemonListResult.name!;
      final pokemonDto = await _pokeApiClient.getPokemon(name: pokemonName);

      final pokemonId = pokemonDto.id!;
      final pokemonIdFormatted = _transformPokemonId(pokemonId);
      final pokemonTypes = pokemonDto.types!
          .map((typeHolder) => typeHolder.type!.name!)
          .toList();

      pokemons.add(
        Pokemon(
          id: pokemonId,
          number: '#$pokemonIdFormatted',
          name: pokemonName[0].toUpperCase() + pokemonName.substring(1),
          image: _baseImageUrl + pokemonIdFormatted + '.png',
          primaryType: PokemonType.values.byName(pokemonTypes[0]),
          secundaryType: pokemonTypes.length == 2
              ? PokemonType.values.byName(pokemonTypes[1])
              : null,
        ),
      );
    }
    return pokemons;
  }

  String _transformPokemonId(int pokemonId) {
    return pokemonId < 10
        ? '00$pokemonId'
        : pokemonId < 100
            ? '0$pokemonId'
            : pokemonId.toString();
  }
}
