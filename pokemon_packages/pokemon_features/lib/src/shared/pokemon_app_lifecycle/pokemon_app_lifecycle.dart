import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_features/src/pokemon_audio/bloc/pokemon_audio_bloc.dart';

class PokemonAppLifecycle extends StatefulWidget {
  const PokemonAppLifecycle({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<PokemonAppLifecycle> createState() => _PokemonAppLifecycleState();
}

class _PokemonAppLifecycleState extends State<PokemonAppLifecycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    String? _pokemonLifecycleState = '';

    setState(() {
      switch (state) {
        case AppLifecycleState.inactive:
          context.read<PokemonAudioBloc>().add(
            const PokemonAudioEvents.onTogglePokemonThemeMusic(
              pausePokemonThemeMusic: true,
            ),
          );
          _pokemonLifecycleState = 'App Lifecycle State: inactive';
          log(_pokemonLifecycleState ?? '');

        case AppLifecycleState.paused:
          context.read<PokemonAudioBloc>().add(
            const PokemonAudioEvents.onTogglePokemonThemeMusic(
              pausePokemonThemeMusic: true,
            ),
          );
          _pokemonLifecycleState = 'App Lifecycle State: paused';
          log(_pokemonLifecycleState ?? '');

        case AppLifecycleState.resumed:
          context.read<PokemonAudioBloc>().add(
            const PokemonAudioEvents.onTogglePokemonThemeMusic(
              pausePokemonThemeMusic: false,
            ),
          );
          _pokemonLifecycleState = 'App Lifecycle State: resumed';
          log(_pokemonLifecycleState ?? '');

        case _:
          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
