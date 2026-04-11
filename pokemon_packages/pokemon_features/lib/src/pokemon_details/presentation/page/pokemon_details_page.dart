import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';
import 'package:pokemon_features/src/pokemon_details/widgets/_headers.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

part '../../widgets/_details_type_badges.dart';
part '../../widgets/_dotted_divider_painter.dart';
part '../../widgets/_stat_rectangle_bar_painter.dart';
part '../../widgets/_strong_against_widget.dart';
part '../../widgets/_weak_against_widget.dart';
part '../../widgets/_pokemon_cry_widget.dart';
part '../../widgets/_pokemon_info_tile.dart';
part '../../widgets/_pokemon_stats_list_widget.dart';
part '../../widgets/_pokemon_details_card.dart';

@RoutePage()
class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonName,
    required this.pokemonTypes,
    super.key,
  });

  final String pokemonName;
  final List<String> pokemonTypes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PokemonDetailsBloc>()
            ..add(PokemonDetailsEvents.onGetPokemonDetails(name: pokemonName)),
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.failure != null) {
            return Center(child: Text(state.failure!.message));
          }

          final pokemon = state.pokemonDetails;

          if (pokemon == null) {
            return const SizedBox.shrink();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PokemonDetailsCard(
                    pokemonSprite: pokemon.sprite ?? '',
                    pokemonTypes: pokemon.type ?? [],
                    pokemonId: pokemon.id ?? 0,
                    pokemonName: pokemon.name ?? '',
                    pokemonFlavorText: pokemon.flavorText ?? '',
                    pokemonGenus: pokemon.genus ?? '',
                  ),
                  const PokemonDivider(),

                  PokemonCryWidget(
                    pokemonName: pokemon.name ?? '',
                    pokemonCry: pokemon.cry ?? '',
                  ),

                  const PokemonDivider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4,
                    children: [
                      PokemonInfoTile(
                        infoTitle: 'height:',
                        infoTitleColor: const Color(0xFFE93F6E),
                        infoValue: StringUtils.convertPokemonHeight(
                          pokemon.height ?? 0,
                        ),
                        infoValueColor: const Color(0xFFE5E5E5),
                        infoFlavor: '///pokedex average',
                        infoFlavorColor: const Color(
                          0xFFB0B0B0,
                        ),
                        tileColor: const Color(0xFF141414),
                      ),

                      PokemonInfoTile(
                        infoTitle: 'ability:',
                        infoTitleColor: const Color(0xFFE93F6E),
                        infoValue: pokemon.ability ?? '',
                        infoValueColor: const Color(0xFF141414),
                        infoFlavor: '///standard (non-hidden)',
                        infoFlavorColor: const Color(
                          0xFF141414,
                        ).withValues(alpha: 35),
                        tileColor: const Color(0xFFE5E5E5),
                      ),

                      PokemonInfoTile(
                        infoTitle: 'weight:',
                        infoTitleColor: const Color(0xFFE93F6E),
                        infoValue: StringUtils.convertPokemonWeight(
                          pokemon.weight ?? 0,
                        ),
                        infoValueColor: const Color(0xFFE5E5E5),
                        infoFlavor: '///pokedex average',
                        infoFlavorColor: const Color(
                          0xFFB0B0B0,
                        ),
                        tileColor: const Color(0xFF141414),
                      ),
                    ],
                  ),

                  const Header(headerText: 'Pokemon Strengths and Weaknesses'),
                  Column(
                    children: [
                      StrongAgainstWidget(pokemonTypes: pokemonTypes),
                      WeakAgainstWidget(pokemonTypes: pokemonTypes),
                    ],
                  ),

                  const Header(headerText: 'Pokemon Stats'),

                  PokemonStatsListWidget(pokemonStats: pokemon.stats ?? []),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
