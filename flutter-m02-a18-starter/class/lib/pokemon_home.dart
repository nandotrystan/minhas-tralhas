import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/pokemon/pokemon_bloc.dart';
import 'package:pokemon/blocs/pokemon/states.dart';
import 'package:pokemon/blocs/theme_cubit.dart';
import 'package:pokemon/components/gradient_pokeball.dart';
import 'package:pokemon/components/pokemon_card.dart';
import 'package:pokemon/models/enum/pokemon_status.dart';
import 'package:pokemon/resources/gradients.dart';
import 'package:pokemon/resources/strings.dart';

class PokemonHome extends StatelessWidget {
  const PokemonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: theme.scaffoldBackgroundColor,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GradientPokeball(
              gradient: PokemonGradients.pokeball(
                  context.read<ThemeCubit>().state == ThemeMode.dark),
              height: 210.0,
            ),
          ],
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              Strings.appName,
              style: theme.textTheme.headlineMedium,
            ),
            elevation: 0.0,
            toolbarHeight: kToolbarHeight + 30.0,
            actions: [
              IconButton(
                onPressed: BlocProvider.of<ThemeCubit>(context).toggleThemeMode,
                icon: BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, themeModeState) {
                    return Icon(
                      themeModeState == ThemeMode.light
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                    );
                  },
                ),
              )
            ],
          ),
          body: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              switch (state.status) {
                case PokemonStatus.initial:
                case PokemonStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case PokemonStatus.success:
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      itemCount: state.pokemons.length,
                      itemBuilder: (_, index) {
                        final pokemon = state.pokemons[index];
                        return PokemonCard(pokemon: pokemon);
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 5,
                      ),
                    ),
                  );
                case PokemonStatus.failure:
                  return Center(child: Text(state.errorMessage!));
              }
            },
          ),
        ),
      ],
    );
  }
}
