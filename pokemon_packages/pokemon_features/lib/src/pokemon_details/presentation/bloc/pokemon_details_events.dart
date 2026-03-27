part of 'pokemon_details_bloc.dart';

@freezed
abstract class PokemonDetailsEvents with _$PokemonDetailsEvents {
  const factory PokemonDetailsEvents.onGetPokemonDetails({
    required String name,
  }) = OnGetPokemonDetails;
  const factory PokemonDetailsEvents.onGetPokemonCry({
    required String pokemonCry,
  }) = OnGetPokemonCry;
}
