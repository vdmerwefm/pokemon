import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

class PokemonMoveTileWidget extends StatelessWidget {
  const PokemonMoveTileWidget({
    required this.pokemonMoveName,
    required this.pokemonMoveType,
    required this.pokemonMoveId,
    required this.pokemonMoveDamageClass,
    super.key,
  });

  final String? pokemonMoveName;
  final String? pokemonMoveType;
  final int? pokemonMoveId;
  final String? pokemonMoveDamageClass;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PokemonAudioBloc>().add(
          const PokemonAudioEvents.onPlaySelectBite(),
        );

        context.router.popAndPush(
          PokemonMoveDetailsRoute(
            name: pokemonMoveName ?? '',
            type: pokemonMoveType ?? '',
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        height: 112,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            ColoredBox(
              color: const Color(0xFF3A3A3A),
              child: Transform.scale(
                scale: 1.7,
                child: Image.asset(
                  GetTypeUtil.getMoveImage(
                    pokemonMoveType ?? '',
                  ),
                  alignment: Alignment.center,
                  package: 'pokemon_ui_kit',
                  fit: BoxFit.contain,
                  width: 100,
                  height: 96,
                ),
              ),
            ),
            Expanded(
              child: ColoredBox(
                color: const Color(0xFF1A1A1A),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    bottom: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height8,
                      Row(
                        spacing: 8,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                            child: Image.asset(
                              alignment: Alignment.topCenter,
                              GetTypeUtil.getTypeBadges(
                                pokemonMoveType ?? '',
                              ),
                              height: 36,
                              width: 36,
                              package: 'pokemon_ui_kit',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  StringUtils.idValidator(
                                    pokemonMoveId,
                                  ).toUpperCase(),
                                  style: pokemonInfoStyle(
                                    const Color(0xFFE5E5E5),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  (pokemonMoveName ?? '')
                                      .toUpperCase()
                                      .split('--')
                                      .first,
                                  style: pokemonInfoStyle(
                                    const Color(0xFFE5E5E5),
                                    fontSize: pokemonMoveName!.length > 19
                                        ? 8
                                        : pokemonMoveName!.length > 14
                                        ? 12
                                        : 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height4,
                      const PokemonDividerAltWidget(
                        padding: 12,
                      ),
                      height8,
                      Flexible(
                        child: Row(
                          spacing: 8,
                          children: [
                            PokemonInfoPill(
                              text: pokemonMoveType ?? '',
                              type: pokemonMoveType,
                            ),
                            PokemonInfoPill(
                              text:
                                  'Damage Class: '
                                  '${pokemonMoveDamageClass ?? ''}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
