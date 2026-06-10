import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/pokemon_moves_list/presentation/bloc/pokemon_moves_list_bloc.dart';
import 'package:pokemon_features/src/shared/widgets/_barrel_shared_widgets.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

@RoutePage()
class PokemonMovesListPage extends StatelessWidget {
  const PokemonMovesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) =>
          sl<PokemonMovesListBloc>()
            ..add(const PokemonMovesListEvents.onGetPokemonMovesList()),
      child: BlocBuilder<PokemonMovesListBloc, PokemonMovesListState>(
        builder: (context, state) {
          final moveList = state.pokemonMovesList;
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsetsGeometry.all(16),
                sliver: SliverList.builder(
                  itemCount: moveList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsGeometry.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () => context.router.popAndPush(
                          PokemonMoveDetailsRoute(
                            name: moveList?[index].name ?? '',
                          ),
                        ),
                        child: Container(
                          color: const Color(0xFF1A1A1A),
                          height: 96,
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            children: [
                              ColoredBox(
                                color: const Color(0xFF3A3A3A),
                                child: Transform.scale(
                                  scale: 1.7,
                                  child: Image.asset(
                                    scale: 4,
                                    GetTypeUtil.getMoveImage(
                                      moveList?[index].type ?? '',
                                    ),
                                    package: 'pokemon_ui_kit',
                                    fit: BoxFit.contain,
                                    width: 100,
                                    height: 96,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    bottom: 8,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                moveList?[index].type ?? '',
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,

                                              children: [
                                                Text(
                                                  StringUtils.idValidator(
                                                    moveList?[index].id,
                                                  ).toUpperCase(),
                                                  style: pokemonInfoStyle(
                                                    const Color(0xFFE5E5E5),
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Text(
                                                  (moveList?[index].name ?? '')
                                                      .toUpperCase(),
                                                  style: pokemonInfoStyle(
                                                    const Color(0xFFE5E5E5),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      height2,
                                      const PokemonDividerAltWidget(
                                        padding: 12,
                                      ),
                                      height8,
                                      Flexible(
                                        child: Row(
                                          spacing: 8,
                                          children: [
                                            PokemonInfoPill(
                                              text:
                                                  'Damage Class: '
                                                  '${moveList?[index].damageClass ?? ''}',
                                            ),
                                            PokemonInfoPill(
                                              text: moveList?[index].type ?? '',
                                              type: moveList?[index].type,
                                            ),
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
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
