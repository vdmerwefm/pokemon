import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) =>
            sl<PokemonAudioBloc>()
              ..add(const PokemonAudioEvents.onPlayPokemonThemeMusic()),
        ),
      ],
      child: child,
    );
  }
}
