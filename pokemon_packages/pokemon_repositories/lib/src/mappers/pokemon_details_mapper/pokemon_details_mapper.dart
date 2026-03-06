import 'package:collection/collection.dart';
import 'package:poke_api_client/poke_api_client.dart';
import 'package:pokemon_models/pokemon_models.dart';

extension PokemonDetailsMapper on RawPokemonDetailsDto {
  PokemonDetailsModel toPokemonDetails(
    RawPokemonSpeciesDetailsDto rawSpeciesDto,
  ) {
    final flavorText = rawSpeciesDto.flavorTextEntries
        ?.firstWhereOrNull(
          (lang) => lang.language?.name == 'en',
        )
        ?.flavorText;

    final genus = rawSpeciesDto.genera
        ?.firstWhereOrNull(
          (lang) => lang.language?.name == 'en',
        )
        ?.genus;

    final pokemonStats = stats?.map((stats) {
      final statName = stats.stat?['name']?.toString() ?? '';
      return PokemonStatsModel(
        baseStat: stats.baseStat ?? 0,
        statName: statName,
      );
    }).toList();

    final pokemonTypes = types?.map((type) {
      final typeName = type.type?['name']?.toString() ?? '';
      return PokemonTypeModel(
        type: typeName,
      );
    }).toList();

    return PokemonDetailsModel(
      id: id ?? 0,
      name: name ?? '',
      height: height ?? 0,
      weight: weight ?? 0,
      isDefault: isDefault ?? false,
      ability: abilities?.firstOrNull?.ability?['name']?.toString() ?? '',
      cry: cries?.legacy ?? '',
      flavorText: flavorText ?? '',
      genus: genus ?? '',
      sprite:
          sprites?.versions?.generationV?.blackWhite?.animated?.frontDefault ??
          '',
      stats: pokemonStats,
      type: pokemonTypes,
    );
  }
}
