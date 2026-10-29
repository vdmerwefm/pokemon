import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_features/src/pokemon_audio/bloc/pokemon_audio_bloc.dart';
import 'package:pokemon_features/src/pokemon_search/presentation/bloc/pokemon_search_bloc.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

class PokemonSearchAppBar extends StatefulWidget {
  const PokemonSearchAppBar({super.key});

  @override
  State<PokemonSearchAppBar> createState() => _PokemonSearchAppBarState();
}

class _PokemonSearchAppBarState extends State<PokemonSearchAppBar> {
  late final TextEditingController _seachController;

  @override
  void initState() {
    super.initState();

    _seachController = TextEditingController();

    _seachController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _seachController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFE93F6E),
      child: BlocBuilder<PokemonSearchBloc, PokemonSearchState>(
        builder: (context, state) {
          return TextField(
            spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
            autocorrect: false,
            enableSuggestions: false,
            controller: _seachController,
            onChanged: (searchString) {
              if (context.router.current.route.name == 'PokemonSearchRoute') {
                context.read<PokemonSearchBloc>().add(
                  PokemonSearchEvents.onPokemonListSearch(
                    searchString: searchString,
                  ),
                );
              } else {
                context.read<PokemonSearchBloc>().add(
                  PokemonSearchEvents.onPokemonMoveSearch(
                    searchString: searchString,
                  ),
                );
              }
            },
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.characters,
            style: pokemonInfoStyle(
              const Color(0xFFE5E5E5),
              fontSize: 20,
            ),
            cursorColor: const Color(0xFFE5E5E5),
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: pokemonInfoStyle(
                const Color(0xFFE5E5E5).withValues(alpha: 0.75),
                fontSize: 20,
              ),
              focusColor: const Color(0xFFE5E5E5),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFFE5E5E5),
                size: 28,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  _seachController.clear();

                  if (context.router.current.route.name ==
                      'PokemonSearchRoute') {
                    context.read<PokemonSearchBloc>().add(
                      const PokemonSearchEvents.onPokemonListSearch(),
                    );
                  } else {
                    context.read<PokemonSearchBloc>().add(
                      const PokemonSearchEvents.onPokemonMoveSearch(),
                    );
                  }

                  context.read<PokemonAudioBloc>().add(
                    const PokemonAudioEvents.onPlaySelectBite(),
                  );
                },
                child: const Icon(
                  Icons.close,
                  color: Color(0xFFE5E5E5),
                  size: 28,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
