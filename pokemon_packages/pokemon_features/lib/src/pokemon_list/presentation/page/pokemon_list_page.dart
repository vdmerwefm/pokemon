import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/pokemon_features.dart';
import 'package:pokemon_features/src/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:skeletonizer/skeletonizer.dart';

part '../../widgets/_type_badges.dart';
part '../../widgets/_load_more_button.dart';
part '../../widgets/_list_skeleton_loader.dart';

@RoutePage()
class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonListBloc>()..add(const OnGetPokemonList()),
      child: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          if (state.failure != null) {
            return Center(
              child: Text(
                state.failure!.message,
                style: pokemonInfoStyle(
                  const Color(0xFFE5E5E5),
                ),
              ),
            );
          }

          final pokemonList = state.pokemonList ?? [];
          final loadingOrEmpty = state.isLoading || pokemonList.isEmpty;

          if (loadingOrEmpty) {
            return ListSkeletonLoader(pokemonListIsEmpty: loadingOrEmpty);
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pokemonList.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemonList[index];
                      return pokemonListTile(
                        pokemon: pokemon,
                        context: context,
                      );
                    },
                  ),
                ),
                const LoadMoreButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget pokemonListTile({
  required PokemonListModel pokemon,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () => context.router.push(PokemonDetailsRoute(name: pokemon.name)),
    child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        color: const Color(0xFF1A1A1A),
        width: MediaQuery.sizeOf(context).width,
        height: 96,
        child: Row(
          children: [
            ColoredBox(
              color: const Color(0xFF3A3A3A),
              child: CachedNetworkImage(
                cacheManager: MyImageCacheManager.customCacheManager,
                imageUrl: pokemon.sprite,
                imageBuilder: (context, imageProvider) {
                  return Transform.scale(
                    scale: 1.4,
                    child: Image(
                      image: imageProvider,
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      width: 100,
                      height: 96,
                    ),
                  );
                },
                placeholder: (context, url) =>
                    const SizedBox(width: 100, height: 96),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name.toUpperCase(),
                      style: pokemonInfoStyle(
                        const Color(0xFFE5E5E5),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      idValidator(pokemon.id),
                      style: pokemonInfoStyle(
                        const Color(0xFFE5E5E5),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      pokemon.genus.toUpperCase().replaceAll('É', 'E'),
                      style: pokemonInfoStyle(
                        const Color(0xFFE5E5E5),
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TypeBadges(types: pokemon.type),
                  ],
                ),
                
              ],
            ),
          ],
        ),
      ),
    ),
  );
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

Color getColor(List<String> types) {
  final type = PokemonType.values.asNameMap()[types.first];
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

TextStyle pokemonInfoStyle(Color color, {double? fontSize}) {
  return TextStyle(
    color: color,
    fontSize: fontSize ?? 18,
    fontFamily: 'pokemon_font',
    fontWeight: FontWeight.w900,
    package: 'pokemon_ui_kit',
  );
}

TextStyle pokemonBadgeTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 10,
    fontFamily: 'pokemon_font',
    fontWeight: FontWeight.w900,
    package: 'pokemon_ui_kit',
  );
}

class MyImageCacheManager {
  static final customCacheManager = CacheManager(
    Config(
      'my_unique_key',
      stalePeriod: const Duration(days: 30), // Forces data to stay for 30 days
      maxNrOfCacheObjects: 500, // Keeps up to 500 images
    ),
  );
}

///already_dead
