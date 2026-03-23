import 'package:collection/collection.dart';
import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonDetailsMapper on GqlPokemonDetailsDto {
  PokemonDetailsModel toPokemonDetails() {
    final rawPokemonDetails = data?.pokemon?.firstOrNull;

    final pokemonFlavorText = rawPokemonDetails
        ?.pokemonFlavorText
        ?.pokemonspecies
        ?.map((e) => e.flavorText)
        .first;
    final pokemonGenus = rawPokemonDetails?.pokemonGenus?.pokemonspecies
        ?.map((e) => e.genus)
        .first;
    final pokemonEvolutions = rawPokemonDetails
        ?.pokemonEvolutions
        ?.pokemonspeciesnames
        ?.pokemonspecies
        ?.map((e) => e.evolutions)
        .first;
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
      stats: toPokemonStatsModel(data?.pokemonstat),
      type: toPokemonTypesModel(data?.pokemon?.firstOrNull?.pokemontypes),
    );
  }

  List<PokemonStatsModel>? toPokemonStatsModel(List<Pokemonstat>? statData) {
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

  List<PokemonTypeModel>? toPokemonTypesModel(List<Pokemontype>? typeData) {
    final pokemonTypesList = <PokemonTypeModel>[];
    for (final type in typeData!) {
      pokemonTypesList.add(PokemonTypeModel(type: type.type?.name ?? ''));
    }
    return pokemonTypesList;
  }
}
