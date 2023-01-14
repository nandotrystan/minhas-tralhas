import 'package:flutter/material.dart';
import 'package:pokemon/app.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/clients/poke_api_client.dart';
import 'package:pokemon/repository/pokemon_repository.dart';

void main() async {
  final pokeApiClient = PokeApiClient(http.Client());
  //final pokemonListDto = await pokeApiClient.getPokemonList(offSet: 0);
  final pokemonRepository = PokemonRepository(pokeApiClient);

  // final pokemons = await pokemonRepository.getPokemons(page: 1);

  // final pokemonDto =
  //     await pokeApiClient.getPokemon(name: pokemonListDto.results![0].name!);

  runApp(PokemonApp(pokemonRepository: pokemonRepository));
}
