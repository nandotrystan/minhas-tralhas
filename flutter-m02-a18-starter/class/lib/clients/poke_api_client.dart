import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/models/dto/pokemon_list_dto.dart';

import '../models/dto/pokemon_dto.dart';

class PokemonListRequestFailure implements Exception {}
class PokemonRequestFailure implements Exception {}

class PokeApiClient {
  static const _baseUrl = 'pokeapi.co';
  static const _basePath = 'api/v2';

  const PokeApiClient(this._httpClient);
  final http.Client _httpClient;

  Future<PokemonListDto> getPokemonList({required int offSet}) async {
    final pokemonListUri =
        Uri.https(_baseUrl, '$_basePath/pokemon', {'offSet': offSet.toString()});
    final pokemonListResponse = await _httpClient.get(pokemonListUri);

    if (pokemonListResponse.statusCode == 200 &&
        pokemonListResponse.body.isNotEmpty) {
      return PokemonListDto.fromJson(jsonDecode(pokemonListResponse.body));
    }
    throw PokemonListRequestFailure();
  }

  Future<PokemonDto> getPokemon({required String name}) async {
    final pokemonUri =
        Uri.https(_baseUrl, '$_basePath/pokemon/$name');
    final pokemonResponse = await _httpClient.get(pokemonUri);

    if (pokemonResponse.statusCode == 200 &&
        pokemonResponse.body.isNotEmpty) {
      return PokemonDto.fromJson(jsonDecode(pokemonResponse.body));
    }
    throw PokemonRequestFailure();
  }
}
