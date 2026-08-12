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
          final moveList = state.paginatedPokemonMovesList;
          if (state.pokemonMovesList == null) {
            return const SizedBox.shrink();
          } else {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsetsGeometry.only(
                    left: 16,
                    right: 16,
                  ),
                  sliver: SliverList.builder(
                    itemCount: moveList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<PokemonAudioBloc>().add(
                            const PokemonAudioEvents.onPlaySelectBite(),
                          );

                          context.router.popAndPush(
                            PokemonMoveDetailsRoute(
                              name: moveList?[index].name ?? '',
                              type: moveList?[index].type ?? '',
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
                                      moveList?[index].type ?? '',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        height8,
                                        Row(
                                          spacing: 8,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                                    (moveList?[index].name ??
                                                            '')
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
                                                text:
                                                    moveList?[index].type ?? '',
                                                type: moveList?[index].type,
                                              ),
                                              PokemonInfoPill(
                                                text:
                                                    'Damage Class: '
                                                    '${moveList?[index].damageClass ?? ''}',
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
                    },
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsetsGeometry.only(bottom: 24),
                  sliver: SliverToBoxAdapter(
                    child: LoadMoreButtonWidget(
                      isLoadingMore: context
                          .watch<PokemonMovesListBloc>()
                          .state
                          .isLoadingMoreMoves,
                      limitReached: context
                          .watch<PokemonMovesListBloc>()
                          .state
                          .dexLimit,
                      text: 'Load More Moves...',
                      loadingText: 'Loading More Moves...',
                      onTap: () => context.read<PokemonMovesListBloc>().add(
                        const PokemonMovesListEvents.onLoadMorePokemonMoves(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
