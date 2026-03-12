part of 'pokemon_details_bloc.dart';

@freezed
abstract class PokemonDetailsEvents with _$PokemonDetailsEvents {
  const factory PokemonDetailsEvents.onGetPokemonDetails({
    required String name,
  }) = OnGetPokemonDetails;
}
