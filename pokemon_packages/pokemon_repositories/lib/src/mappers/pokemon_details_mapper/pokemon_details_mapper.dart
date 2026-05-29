import 'package:collection/collection.dart';
import 'package:poke_gql_client/poke_gql_client.dart';
import 'package:pokemon_models/pokemon_models.dart';
import 'package:pokemon_repositories/src/mappers/pokemon_details_mapper/pokemon_details_converters.dart';

extension PokemonDetailsMapper on GqlPokemonDetailsDto {
  PokemonDetailsModel toPokemonDetails() {
    final rawPokemonDetails = data?.pokemon?.firstOrNull;

    final pokemonAbility = rawPokemonDetails?.pokemonabilities
        ?.map((ability) => ability.ability?.name ?? '')
        .toSet()
        .toList();

    final pokemonCry =
        rawPokemonDetails?.pokemoncries?.first.cries?['latest'] as String? ??
        rawPokemonDetails?.pokemoncries?.first.cries?['legacy'] as String?;

    final pokemonFlavorText = rawPokemonDetails
        ?.pokemonFlavorText
        ?.pokemonspecies
        ?.firstOrNull
        ?.flavorText;

    final pokemonGenus = rawPokemonDetails?.pokemonGenus?.pokemonspecies
        ?.map((e) => e.genus)
        .first;

    final pokemonEvolutions = Converters.convertToEvolutionsModel(
      rawPokemonDetails?.pokemonEvolutions?.pokemonspeciesnames,
    );

    final pokemonForms = Converters.convertToFormsModel(
      rawPokemonDetails?.pokemonEvolutions?.pokemonspeciesnames,
    );

    final pokemonSprite =
        rawPokemonDetails?.pokemonsprites?.firstOrNull?.sprites;

    final pokemonLevelUpMoves = convertToMovessModel(
      rawPokemonDetails?.pokemonmoves ?? [],
    )?.where((method) => method.pokemonMoveLearnMethod == 'level-up').toList();

    final pokemonMachineMoves = convertToMovessModel(
      rawPokemonDetails?.pokemonmoves ?? [],
    )?.where((method) => method.pokemonMoveLearnMethod == 'machine').toList();

    final pokemonTutorMoves = convertToMovessModel(
      rawPokemonDetails?.pokemonmoves ?? [],
    )?.where((method) => method.pokemonMoveLearnMethod == 'tutor').toList();

    final pokemonStats = convertToStatsModel(data?.pokemonstat);

    final pokemonTypes = rawPokemonDetails?.pokemontypes
        ?.map((e) => e.type?.name ?? '')
        .toSet()
        .toList();

    return PokemonDetailsModel(
      id: rawPokemonDetails?.id ?? 0,
      name: rawPokemonDetails?.name ?? '',
      height: rawPokemonDetails?.height ?? 0,
      weight: rawPokemonDetails?.weight ?? 0,
      isDefault: rawPokemonDetails?.isDefault ?? true,
      ability: pokemonAbility ?? [],
      cry: pokemonCry ?? '',
      flavorText: pokemonFlavorText ?? '',
      genus: pokemonGenus ?? '',
      evolutions: pokemonEvolutions ?? [],
      forms: pokemonForms ?? [],
      sprite: pokemonSprite ?? '',
      levelUpMoves: pokemonLevelUpMoves ?? [],
      machineMoves: pokemonMachineMoves ?? [],
      tutorMoves: pokemonTutorMoves ?? [],
      stats: pokemonStats ?? [],
      type: pokemonTypes ?? [],
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

  List<PokemonMovesModel>? convertToMovessModel(List<Pokemonmove>? moveData) {
    final pokemonMovesList = <PokemonMovesModel>[];
    for (final move in moveData!) {
      if (!pokemonMovesList.contains(
        PokemonMovesModel(
          pokemonMoveLevel: move.level ?? 0,
          pokemonMoveName: move.move?.name ?? '',
          pokemonMoveType: move.move?.type?.name ?? '',
          pokemonMoveLearnMethod: move.movelearnmethod?.name ?? '',
        ),
      )) {
        pokemonMovesList
          ..add(
            PokemonMovesModel(
              pokemonMoveLevel: move.level ?? 0,
              pokemonMoveName: move.move?.name ?? '',
              pokemonMoveType: move.move?.type?.name ?? '',
              pokemonMoveLearnMethod: move.movelearnmethod?.name ?? '',
            ),
          )
          ..removeWhere((e) => e.pokemonMoveLearnMethod == 'egg');
      }
    }
    return pokemonMovesList.toSet().toList();
  }
}
