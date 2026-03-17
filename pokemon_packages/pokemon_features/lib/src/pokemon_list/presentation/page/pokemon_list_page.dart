import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_details/presentation/page/pokemon_details_page.dart';
import 'package:pokemon_features/src/pokemon_list/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_models/pokemon_models.dart';

part '../../widgets/_type_badges.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonListBloc>()..add(const OnGetPokemonList()),
      child: BlocBuilder<PokemonListBloc, PokemonListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.failure != null) {
            return Center(child: Text(state.failure!.message));
          }

          final pokemonList = state.pokemonList ?? [];

          if (pokemonList.isEmpty) {
            return const Center(child: Text('No Pokemon found'));
          }
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return pokemonListTile(
                  pokemon: pokemon,
                  context: context,
                  route: MaterialPageRoute<dynamic>(
                    builder: (context) =>
                        PokemonDetailsPage(name: pokemon.name),
                  ),
                );
              },
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
  required Route<dynamic> route,
}) {
  return GestureDetector(
    onTap: () => {},//Navigator.push(context, route),
    child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        color: Colors.black12,
        width: MediaQuery.sizeOf(context).width,
        height: 96,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          children: [
            Wrap(
              direction: Axis.horizontal,
              children: [
                ColoredBox(
                  color: getColor(pokemon.type),
                  child: Image.network(
                    alignment: Alignment.center,
                    pokemon.sprite,
                    fit: BoxFit.none,
                    scale: 3.6,
                    width: 100,
                    height: 96,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:12, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        pokemon.name.toUpperCase(),
                        style: pokemonStyle(
                          Colors.black,
                        ),
                      ),
                      Text(
                        idValidator(pokemon.id),
                        style: pokemonStyle(
                          Colors.black45,
                        ),
                      ),
                      Text(
                        pokemon.genus.toUpperCase().replaceAll('É', 'E'),
                        style: pokemonStyle(
                          Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: _badgepadding(pokemon.type),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TypeBadges(types: pokemon.type),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
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

EdgeInsets _badgepadding(List<String> types) {
  if (types.length == 1) {
    return const EdgeInsets.only(top: 36, right: 12);
  } else {
    return const EdgeInsets.only(top: 20, right: 12);
  }
}

Color getColor(List<String> types) {
  final type = PokemonType.values.asNameMap()[types.first];
  return switch (type) {
    PokemonType.bug => const Color(0xFFC2D501),
    PokemonType.dark => const Color(0xFF5F504D),
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

TextStyle pokemonStyle(Color color) {
  return const TextStyle(
    fontSize: 20,
    fontFamily: 'pokemon_font',
    fontWeight: FontWeight.w900,
    package: 'pokemon_ui_kit',
  );
}

///already_dead
