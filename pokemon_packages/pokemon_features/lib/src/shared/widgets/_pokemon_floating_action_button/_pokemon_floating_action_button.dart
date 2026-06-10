import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_features/pokemon_features.dart';

class PokemonFloatingActionButton extends StatefulWidget {
  const PokemonFloatingActionButton({
    super.key,
  });

  @override
  State<PokemonFloatingActionButton> createState() =>
      _PokemonFloatingActionButtonState();
}

class _PokemonFloatingActionButtonState
    extends State<PokemonFloatingActionButton> {
  bool isMute = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PokemonAudioBloc>().add(
          const PokemonAudioEvents.onPlaySelectBite(),
        );
        context.read<PokemonAudioBloc>().add(
          const PokemonAudioEvents.onTogglePokemonThemeMusic(),
        );

        setState(() {
          isMute = !isMute;
        });
      },

      child: isMute
          ? Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFFE93F6E),
              ),
              child: const Icon(
                Icons.volume_off_rounded,
                color: Color(0xFFE5E5E5),
                size: 32,
              ),
            )
          : Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFFE93F6E),
              ),
              child: const Icon(
                Icons.volume_up_rounded,
                color: Color(0xFFE5E5E5),
                size: 32,
              ),
            ),
    );
  }
}
