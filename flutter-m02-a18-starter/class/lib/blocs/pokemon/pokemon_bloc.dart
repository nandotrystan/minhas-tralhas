import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemon/events.dart';
import 'package:pokemon/models/enum/pokemon_status.dart';
import 'package:pokemon/repository/pokemon_repository.dart';

import '../../resources/strings.dart';
import 'states.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc(this._pokemonRepository)
      : super(const PokemonState(
            status: PokemonStatus.initial, page: 0, pokemons: [])) {
    on<PokemonLoaded>(_onPokemonLoaded);
  }

  final PokemonRepository _pokemonRepository;

  void _onPokemonLoaded(PokemonLoaded event, Emitter<PokemonState> emit) async {
    emit(state.copyWith(status: PokemonStatus.loading));
    try {
      final newPage = state.page + 1;
      final pokemons = await _pokemonRepository.getPokemons(page: newPage);
      emit(state.copyWith(
          status: PokemonStatus.success, page: newPage, pokemons: pokemons));
    } on Exception {
      emit(state.copyWith(
          status: PokemonStatus.failure, errorMessage: Strings.errorMessage));
    }
  }
}
