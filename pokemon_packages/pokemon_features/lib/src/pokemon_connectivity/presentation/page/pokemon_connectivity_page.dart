import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

class PokemonConnectivityPage extends StatelessWidget {
  const PokemonConnectivityPage({
    required this.isPokemonListPageEmpty,
    super.key,
  });
  final bool isPokemonListPageEmpty;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonConnectivityBloc, PokemonConnectivityState>(
      builder: (context, state) {
        if (state.isConnected == true && isPokemonListPageEmpty == true) {
          context.read<PokemonListBloc>().add(
            const PokemonListEvents.onGetPokemonList(),
          );
        }
        return IgnorePointer(
          ignoring: state.isConnected,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            opacity: !state.isConnected ? 1 : 0,
            child: Material(
              color: const Color(0xFFE5E5E5),
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Uh-oh...'.toUpperCase(),
                              style: pokemonInfoStyle(
                                const Color(0xFF1A1A1A),
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              maxLines: 7,
                              'connection interrupted'.toUpperCase(),
                              style: pokemonInfoStyle(
                                const Color(0xFF1A1A1A),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        height24,
                        Image.asset(
                          height: 240,
                          width: 240,
                          fit: BoxFit.cover,
                          'lib/src/assets/images/ailment/fainted.png',
                          package: 'pokemon_ui_kit',
                        ),
                        height24,
                        Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              maxLines: 7,
                              'please reconnect to continue...'.toUpperCase(),
                              style: pokemonInfoStyle(
                                const Color(0xFF1A1A1A),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
