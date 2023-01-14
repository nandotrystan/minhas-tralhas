import 'package:pokemon/models/domain/pokemon.dart';
import 'package:pokemon/models/enum/pokemon_status.dart';

class PokemonState {
  const PokemonState({
    required this.status,
    required this.page,
    required this.pokemons,
    this.errorMessage,
  });

  final PokemonStatus status;
  final int page;
  final List<Pokemon> pokemons;
  final String? errorMessage;

  PokemonState copyWith({
    PokemonStatus? status,
    int? page,
    List<Pokemon>? pokemons,
    final String? errorMessage,
  }) {
    return PokemonState(
        status: status ?? this.status,
        page: page ?? this.page,
        pokemons: pokemons ?? this.pokemons,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
