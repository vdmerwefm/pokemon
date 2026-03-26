import 'package:collection/collection.dart';
import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonDetailsMapper on GqlPokemonDetailsDto {
  PokemonDetailsModel toPokemonDetails() {
    final rawPokemonDetails = data?.pokemon?.firstOrNull;

    final pokemonFlavorText = rawPokemonDetails
        ?.pokemonFlavorText
        ?.pokemonspecies
        ?.firstOrNull
        ?.flavorText;
    final pokemonGenus = rawPokemonDetails?.pokemonGenus?.pokemonspecies
        ?.map((e) => e.genus)
        .first;
    final pokemonEvolutions = rawPokemonDetails
        ?.pokemonEvolutions
        ?.pokemonspeciesnames
        ?.pokemonspecies
        ?.map((e) => e.name)
        .whereType<String>()
        .toList();

    final pokemonSprite =
        (rawPokemonDetails
                    ?.pokemonsprites
                    ?.firstOrNull
                    ?.sprites
                    ?.other?['official-artwork']
                as Map<String, dynamic>?)?['front_default']
            as String?;

    return PokemonDetailsModel(
      id: rawPokemonDetails?.id,
      name: rawPokemonDetails?.name,
      height: rawPokemonDetails?.height,
      weight: rawPokemonDetails?.weight,
      isDefault: rawPokemonDetails?.isDefault,
      ability: rawPokemonDetails?.pokemonabilities?.first.ability?.name ?? '',
      cry:
          rawPokemonDetails?.pokemoncries?.first.cries?['latest'] as String? ??
          rawPokemonDetails?.pokemoncries?.first.cries?['legacy'] as String?,
      flavorText: pokemonFlavorText,
      genus: pokemonGenus,
      evolutions: pokemonEvolutions,
      sprite: pokemonSprite ?? '',
      moves:
          rawPokemonDetails?.pokemonmoves!
              .map((moves) => moves.move?.name ?? '')
              .toList() ??
          [],
      stats: convertToStatsModel(data?.pokemonstat),
      type: rawPokemonDetails?.pokemontypes?.map((e) => e.type?.name ?? '').toList()
    );
  }

  List<PokemonStatsModel>? convertToStatsModel(List<Pokemonstat>? statData) {
    final pokemonStatsList = <PokemonStatsModel>[];
    for (final stat in statData!) {
      pokemonStatsList.add(
        PokemonStatsModel(
          baseStat: stat.baseStat ?? 0,
          statName: stat.stat?.name ?? '',
        ),
      );
    }
    return pokemonStatsList;
  }

}
