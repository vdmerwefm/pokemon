import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/data.dart';

part 'gql_pokemon_evolution_chain_details_dto.freezed.dart';
part 'gql_pokemon_evolution_chain_details_dto.g.dart';

@freezed
class GqlPokemonEvolutionChainDetailsDto
    with _$GqlPokemonEvolutionChainDetailsDto {
  factory GqlPokemonEvolutionChainDetailsDto({
    Data? data,
  }) = _GqlPokemonEvolutionChainDetailsDto;

  factory GqlPokemonEvolutionChainDetailsDto.fromJson(
    Map<String, dynamic> json,
  ) => _$GqlPokemonEvolutionChainDetailsDtoFromJson(json);

  factory GqlPokemonEvolutionChainDetailsDto.empty() =>
      GqlPokemonEvolutionChainDetailsDto();
}
