import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_move_details/presentation/bloc/pokemon_move_details_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

@RoutePage()
class PokemonMoveDetailsPage extends StatelessWidget {
  const PokemonMoveDetailsPage({
    required this.name,
    required this.type,
    super.key,
  });

  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    return PokemonScaffold(
      body: BlocProvider(
        create: (context) => sl<PokemonMoveDetailsBloc>()
          ..add(PokemonMoveDetailsEvents.onGetPokemonMoveDetails(name: name))
          ..add(
            PokemonMoveDetailsEvents.onGetMoveDamageIndecies(types: [type]),
          ),
        child: BlocBuilder<PokemonMoveDetailsBloc, PokemonMoveDetailsState>(
          builder: (context, state) {
            final moveData = state.pokemonMoveDetails;
            if (moveData != null) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        color: const Color(0xFF1A1A1A),
                        width: MediaQuery.sizeOf(context).width,
                        height: 208,
                        child: Row(
                          children: [
                            ColoredBox(
                              color: const Color(0xFF3A3A3A),
                              child: Transform.scale(
                                scale: 1.7,
                                child: Image.asset(
                                  scale: 4,
                                  GetTypeUtil.getMoveImage(
                                    type,
                                  ),
                                  package: 'pokemon_ui_kit',
                                  fit: BoxFit.contain,
                                  width: 100,
                                  height: 208,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  left: 16,
                                ),
                                child: Column(
                                  spacing: 2,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      spacing: 8,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                          child: Image.asset(
                                            alignment: Alignment.topCenter,
                                            GetTypeUtil.getTypeBadges(
                                              type,
                                            ),
                                            height: 36,
                                            width: 36,
                                            package: 'pokemon_ui_kit',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8,
                                          ),
                                          child: Column(
                                            spacing: 2,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                StringUtils.idValidator(
                                                  moveData.id ?? 0,
                                                ),
                                                style: pokemonInfoStyle(
                                                  const Color(0xFFE5E5E5),
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                (moveData.name ?? '')
                                                    .toUpperCase(),
                                                style: pokemonInfoStyle(
                                                  const Color(0xFFE5E5E5),
                                                  fontSize: 14,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    height8,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 8,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8,
                                          ),
                                          child: Text(
                                            StringUtils.restructurePokemonFlavorText(
                                              moveData.moveFlavorText ?? '',
                                            ),
                                            style: pokemonInfoStyle(
                                              const Color(0xFFE5E5E5),
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),

                                        const PokemonDividerAltWidget(
                                          height: 8,
                                          padding: 8,
                                        ),
                                      ],
                                    ),
                                    height4,
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Row(
                                        spacing: 8,
                                        children: [
                                          PokemonInfoPill(
                                            text: moveData.type ?? '',
                                            type: moveData.type,
                                          ),
                                          PokemonInfoPill(
                                            text: moveData.damageClass ?? '',
                                          ),
                                          if (moveData.machines != null) ...[
                                            const PokemonInfoPill(
                                              text: 'Machine',
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      height16,
                      const HeaderWidget(
                        headerText: 'Ailment, Effect, and Damage Class',
                        fontSize: 10,
                      ),
                      height16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ailment:'.toUpperCase(),
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            moveData.ailment?.toUpperCase() ?? '',
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      height16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Effect:'.toUpperCase(),
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            moveData.effect?.toUpperCase().substring(
                                  0,
                                  moveData.effect!.length - 1,
                                ) ??
                                '',
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      height16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Damage Class:'.toUpperCase(),
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            moveData.damageClassDescription?.toUpperCase() ??
                                '',
                            style: pokemonInfoStyle(
                              const Color(0xFFE5E5E5),
                              fontSize: 8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      height16,
                      const PokemonDividerWidget(),
                      height16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 4,
                        children: [
                          PokemonInfoTileWidget(
                            infoTitle: 'Power:',
                            infoTitleColor: const Color(0xFFE93F6E),
                            infoValue: '${moveData.power} points',
                            infoValueColor: const Color(0xFFE5E5E5),
                            infoFlavor: '///damage output',
                            infoFlavorColor: const Color(
                              0xFFB0B0B0,
                            ),
                            tileColor: const Color(0xFF141414),
                          ),
                          PokemonInfoTileWidget(
                            infoTitle: 'Accuracy:',
                            infoTitleColor: const Color(0xFFE93F6E),
                            infoValue: '${moveData.accuracy} points',
                            infoValueColor: const Color(0xFF141414),
                            infoFlavor: '///liklihood of landing',
                            infoFlavorColor: const Color(
                              0xFF141414,
                            ).withValues(alpha: 35),
                            tileColor: const Color(0xFFE5E5E5),
                          ),

                          PokemonInfoTileWidget(
                            infoTitle: 'PP:',
                            infoTitleColor: const Color(0xFFE93F6E),
                            infoValue: '${moveData.pp} points',
                            infoValueColor: const Color(0xFFE5E5E5),
                            infoFlavor: '///move attempts',
                            infoFlavorColor: const Color(
                              0xFFB0B0B0,
                            ),
                            tileColor: const Color(0xFF141414),
                          ),
                        ],
                      ),
                      height16,

                      Column(
                        key: key,
                        children: [
                          const HeaderWidget(
                            headerText: 'Strengths and Weaknesses',
                            fontSize: 10,
                          ),
                          height16,
                          Padding(
                            padding: (state.strongAgainst ?? []).isNotEmpty
                                ? const EdgeInsets.only(bottom: 16)
                                : EdgeInsets.zero,
                            child: DetailsTypeBadgesWidget(
                              pokemonTypes: state.strongAgainst ?? [],
                              text: 'Strong Against',
                            ),
                          ),
                          DetailsTypeBadgesWidget(
                            pokemonTypes: state.weakAgainst ?? [],
                            text: 'Weak Against',
                          ),
                        ],
                      ),
                      height16,
                      const HeaderWidget(
                        headerText: 'can learn:',
                        fontSize: 8,
                      ),
                      Column(
                        children: moveData.pokemon!
                            .map(
                              (e) => PokemonListTileWidget(
                                pokemonSprite: e.sprite,
                                pokemonName: e.name,
                                pokemonTypes: e.type,
                                pokemonId: e.id,
                                pokemonGenus: e.genus,
                              ),
                            )
                            .toList(),
                      ),
                      height16,
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
