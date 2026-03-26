import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';
import 'package:pokemon_features/src/pokemon_details/widgets/_dotted_divider.dart';
import 'package:pokemon_models/pokemon_models.dart';

@RoutePage()
class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PokemonDetailsBloc>()
            ..add(PokemonDetailsEvents.onGetPokemonDetails(name: name)),
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.failure != null) {
            return Center(child: Text(state.failure!.message));
          }

          final pokemon = state.pokemonDetails;
         // final pokemonStats = state.pokemonDetails?.stats;
          final pokemonTypes = state.pokemonDetails?.type;

          if (pokemon == null) {
            return const Center(child: Text('No details found'));
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
                                          pokemonTypes?.first ?? '',
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
                                  spacing: 12,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        pokemon.flavorText?.replaceAll(
                                              '\n',
                                              ' ',
                                            ) ??
                                            '',
                                        style: pokemonInfoStyle(
                                          const Color(0xFFE5E5E5),
                                          fontSize: 6,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding: const EdgeInsets.only(right: 8),
                                      height: 1,
                                      width: double.infinity,
                                      child: CustomPaint(
                                        painter: DottedDivider(
                                          color: const Color(0xFFE5E5E5),
                                        ),
                                      ),
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
                                        (e) {
                                          return Container(
                                            padding: const EdgeInsets.only(
                                              top: 4,
                                              bottom: 2,
                                              left: 4,
                                              right: 4,
                                            ),
                                            color: getColor(e),
                                            child: Text(
                                              e.toUpperCase(),
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
                  ///Start of Pokemon Characteristics Card
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4,
                    children: [
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
                                    const Color(0xFF141414),
                                    fontSize: 8,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '///pokedex average',
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
                          color: const Color(0xFFE5E5E5),
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
                                    const Color(0xFF141414),
                                    fontSize: 8,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '///pokedex average',
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
                    ],
                  ),

                  ///End of Pokemon Charactieristics Card
                  const SizedBox(height: 16),
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

  Color getColor(String types) {
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
}
