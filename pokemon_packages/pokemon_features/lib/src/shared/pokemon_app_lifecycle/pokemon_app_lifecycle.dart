import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_features/pokemon_features.dart';
class PokemonAppLifecycle extends StatefulWidget {
  const PokemonAppLifecycle({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<PokemonAppLifecycle> createState() => _PokemonAppLifecycleState();
}

Timer? _pokemonLifecycleDebounce;

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
    _pokemonLifecycleDebounce?.cancel();
    _pokemonLifecycleDebounce = Timer(const Duration(milliseconds: 250), () {
      if (!mounted) return;

      String? _pokemonLifecycleState = '';

      setState(() {
        switch (state) {
          case AppLifecycleState.inactive:
            _getAudioEvent(state);
            _pauseConnectivityCheck(state);

            _pokemonLifecycleState = 'App Lifecycle State: $state';
            log(_pokemonLifecycleState ?? '');

          case AppLifecycleState.resumed:
            _getAudioEvent(state);
            _resumeConnectivityCheck(state);

            _pokemonLifecycleState = 'App Lifecycle State: resumed';
            log(_pokemonLifecycleState ?? '');

          case _:
            _getAudioEvent(state);
            _pauseConnectivityCheck(state);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pokemonLifecycleDebounce?.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _pauseConnectivityCheck(AppLifecycleState state) {
    context.read<PokemonConnectivityBloc>().add(
      PokemonConnectivityEvents.onPausePokemonConnectivityCheck(state: state),
    );
  }

  void _resumeConnectivityCheck(AppLifecycleState state) {
    context.read<PokemonConnectivityBloc>().add(
      PokemonConnectivityEvents.onResumePokemonConnectivityCheck(state: state),
    );
  }

  void _getAudioEvent(AppLifecycleState state) {
    context.read<PokemonAudioBloc>().add(
      PokemonAudioEvents.onLifecyclePokemonThemeMusic(
        state: state,
      ),
    );
  }
}
