import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_ui_kit/pokemon_ui_kit.dart';

part '../../widgets/_details_type_badges.dart';
part '../../widgets/_dotted_divider_painter.dart';
part '../../widgets/_stat_rectangle_bar_painter.dart';
part '../../widgets/_strong_against_widget.dart';
part '../../widgets/_weak_against_widget.dart';

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
                ///Start of pokemon base info card
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xFF1A1A1A),
                    width: MediaQuery.sizeOf(context).width,
                    height: 208,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ColoredBox(
                          color: const Color(0xFF3A3A3A),
                          child: CachedNetworkImage(
                            cacheManager:
                                MyImageCacheManager.customCacheManager,
                            imageUrl: pokemon.sprite ?? '',
                            imageBuilder: (context, imageProvider) {
                              return Transform.scale(
                                alignment: AlignmentDirectional.center,
                                scale: 1.4,
                                child: Image(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                  width: 124,
                                  height: 208,
                                ),
                              );
                            },
                            placeholder: (context, url) =>
                                const SizedBox(width: 100, height: 96),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 8, left: 24),
                            child: Column(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  spacing: 8,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        alignment: Alignment.topCenter,
                                        getTypeBadges(
                                          pokemonTypes.first,
                                        ),
                                        height: 36,
                                        width: 36,
                                        package: 'pokemon_ui_kit',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Column(
                                        spacing: 4,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            idValidator(pokemon.id!),
                                            style: pokemonInfoStyle(
                                              const Color(0xFFE5E5E5),
                                              fontSize: 8,
                                            ),
                                          ),
                                          Text(
                                            pokemon.name!.toUpperCase(),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 6,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        restructurePokemonFlavorText(
                                          pokemon.flavorText ?? '',
                                        ),
                                        style: pokemonInfoStyle(
                                          const Color(0xFFE5E5E5),
                                          fontSize: 6,
                                        ),
                                      ),
                                    ),

                                    const PokemonDividerAlt(
                                      height: 8,
                                      padding: 8,
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 8,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 4,
                                        bottom: 2,
                                        left: 4,
                                        right: 4,
                                      ),
                                      color: const Color(0xFF3A3A3A),
                                      child: Text(
                                        pokemon.genus!.toUpperCase().replaceAll(
                                          'É',
                                          'E',
                                        ),
                                        style: pokemonInfoStyle(
                                          const Color(0xFFE5E5E5),
                                          fontSize: 6,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      spacing: 8,
                                      children: state.pokemonDetails!.type!.map(
                                        (type) {
                                          return Container(
                                            padding: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 2,
                                              left: 4,
                                              right: 4,
                                            ),
                                            color: GetTypeBadgeUtil.getColor(
                                              type,
                                            ),
                                            child: Text(
                                              type.toUpperCase(),
                                              style: pokemonInfoStyle(
                                                const Color(0xFFE5E5E5),
                                                fontSize: 6,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///End of pokemon base info card
                  const PokemonDivider(),
                  GestureDetector(
                    onTap: () => context.read<PokemonDetailsBloc>()
                      ..add(
                        PokemonDetailsEvents.onGetPokemonCry(
                          pokemonCry: pokemon.cry!,
                        ),
                      ),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          const ColoredBox(
                            color: Color(0xFF141414),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              'PLAY ${pokemon.name!.toUpperCase()} CRY',
                              style: pokemonInfoStyle(
                                const Color(0xFFE5E5E5),
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const PokemonDivider(),

                  ///Start of Pokemon Characteristics Card
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: const Color(0xFF141414),
                          child: SizedBox.fromSize(
                            size: const Size(double.infinity, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'HEIGHT:',
                                  style: pokemonInfoStyle(
                                    const Color(0xFFE93F6E),
                                    fontSize: 10,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  convertPokemonHeight(
                                    pokemon.height,
                                  ).toUpperCase(),
                                  style: pokemonInfoStyle(
                                    const Color(0xFFE5E5E5),
                                    fontSize: 8,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Text(
                                  '///pokedex average',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(
                                      0xFFB0B0B0,
                                    ),
                                    fontSize: 6,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: const Color(0xFFE5E5E5),
                          child: SizedBox.fromSize(
                            size: const Size(double.infinity, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ABILITY:',
                                  style: pokemonInfoStyle(
                                    const Color(0xFFE93F6E),
                                    fontSize: 10,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  pokemon.ability!.toUpperCase(),
                                  style: pokemonInfoStyle(
                                    const Color(0xFF141414),
                                    fontSize: 8,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '///standard (non-hidden)',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: const Color(
                                      0xFF141414,
                                    ).withValues(alpha: 35),
                                    fontSize: 6,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: const Color(0xFF141414),
                          child: SizedBox.fromSize(
                            size: const Size(double.infinity, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'WEIGHT:',
                                  style: pokemonInfoStyle(
                                    const Color(0xFFE93F6E),
                                    fontSize: 10,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${pokemon.weight} kg'.toUpperCase(),
                                  style: pokemonInfoStyle(
                                    const Color(0xFFE5E5E5),
                                    fontSize: 8,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Text(
                                  '///pokedex average',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(
                                      0xFFB0B0B0,
                                    ),
                                    fontSize: 6,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///End of Pokemon Charactieristics Card
                  StrongAgainstWidget(pokemonTypes: pokemonTypes),
                  WeakAgainstWidget(pokemonTypes: pokemonTypes),

                  const PokemonDivider(),

                  ///
                  Column(
                    spacing: 8,
                    children: pokemon.stats!.map((stat) {
                      return Column(
                        spacing: 8,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 4),
                            alignment: Alignment.center,
                            width: double.infinity,
                            color: const Color(0xFFE5E5E5),
                            child: Text(
                              '${stat.statName.toUpperCase()} : ${stat.baseStat.toString().toUpperCase()}',
                              style: pokemonInfoStyle(
                                const Color(0xFF1A1A1A),
                                fontSize: 8,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: double.infinity,
                            child: ClipRect(
                              child: CustomPaint(
                                painter: BarPainter(
                                  baseColor: const Color(0xFF1A1A1A),
                                  fillColor: const Color(0xFFE5E5E5),
                                  blockWidth: 8,
                                  stat: stat.baseStat.toDouble(),
                                ),
                              ),
                            ),
                          ),
                          const PokemonDivider(
                            height: 16,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static String getTypeBadges(String typeFromData) {
    String? badge;
    for (final type in PokemonType.values) {
      if (type.name == typeFromData) {
        badge = type.imagePath;
      }
    }
    return badge ?? '';
  }

  String convertPokemonHeight(int? height) {
    return '${height! * 10} cm';
  }

  static Color getColor(String types) {
    final type = PokemonType.values.asNameMap()[types];
    return switch (type) {
      PokemonType.bug => const Color(0xFFC2D501),
      PokemonType.dark => const Color(0xFF3A3A3A),
      PokemonType.dragon => const Color(0xFF406CA9),
      PokemonType.electric => const Color(0xFFFCDC00),
      PokemonType.fairy => const Color(0xFFF3B1DB),
      PokemonType.fighting => const Color(0xFFFCB600),
      PokemonType.fire => const Color(0xFFFC671A),
      PokemonType.flying => const Color(0xFF93D5E8),
      PokemonType.ghost => const Color(0xFF805474),
      PokemonType.grass => const Color(0xFF35D32F),
      PokemonType.ground => const Color(0xFFC6883D),
      PokemonType.ice => const Color(0xFF1DC1DD),
      PokemonType.normal => const Color(0xFFC3BEB5),
      PokemonType.poison => const Color(0xFFB04EC4),
      PokemonType.psychic => const Color(0xFFF16177),
      PokemonType.rock => const Color(0xFFCBC594),
      PokemonType.steel => const Color(0xFF72C3D5),
      PokemonType.water => const Color(0xFF0083C2),
      _ => const Color(0xFFE93F6E),
    };
  }

  String idValidator(int id) {
    final pokemonId = id.toString();
    if (pokemonId.length == 1) {
      return '#00$pokemonId';
    } else if (pokemonId.length == 2) {
      return '#0$pokemonId';
    } else {
      return '#$pokemonId';
    }
  }

  String restructurePokemonFlavorText(String flavorText) {
    return flavorText
        .replaceAll('\n', ' ')
        .replaceAll('\f', ' ')
        .replaceAll('’', "'")
        .replaceAll('é', 'E');
  }
}
