part of 'pokemon_details_bloc.dart';

@freezed
class PokemonDetailsState with _$PokemonDetailsState {
  const factory PokemonDetailsState({
    PokemonDetailsModel? pokemonDetails,
    Failure? failure,
    @Default(false) bool isLoading,
  }) = _PokemonDetailsState;

  factory PokemonDetailsState.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsStateFromJson(json);

  factory PokemonDetailsState.empty() => const PokemonDetailsState();
}
