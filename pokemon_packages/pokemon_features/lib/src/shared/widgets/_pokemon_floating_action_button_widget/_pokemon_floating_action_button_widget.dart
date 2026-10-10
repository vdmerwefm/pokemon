import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_features/pokemon_features.dart';

class PokemonFloatingActionButton extends StatelessWidget {
  const PokemonFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _isMuted = context.watch<PokemonAudioBloc>().state.toggleThemeMusic;
    return _isMuted
        ? floatingActionButtonHelper(
            context: context,
            icon: Icons.volume_up_rounded,
            mute: false,
          )
        : floatingActionButtonHelper(
            context: context,
            icon: Icons.volume_off_rounded,
            mute: true,
          );
  }

  Widget floatingActionButtonHelper({
    required IconData icon,
    required BuildContext context,
    required bool mute,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<PokemonAudioBloc>().add(
          const PokemonAudioEvents.onPlaySelectBite(),
        );
        context.read<PokemonAudioBloc>().add(
          PokemonAudioEvents.onTogglePokemonThemeMusic(
            pausePokemonThemeMusic: mute,
          ),
        );
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFFE93F6E),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFE5E5E5),
          size: 32,
        ),
      ),
    );
  }
}
