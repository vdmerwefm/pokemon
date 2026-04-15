part of 'pokemon_details_bloc.dart';

@freezed
abstract class PokemonDetailsEvents with _$PokemonDetailsEvents {
  const factory PokemonDetailsEvents.onGetPokemonDetails({
    required String name,
  }) = OnGetPokemonDetails;
  const factory PokemonDetailsEvents.onGetPokemonDamageIndecies({
    required List<String> types,
  }) = OnGetPokemonDamageIndecies;
  const factory PokemonDetailsEvents.onGetPokemonEvolutionChain({
    required List<String> names,
  }) = OnGetPokemonEvolutionChain;
}
