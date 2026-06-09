part of 'pokemon_move_details_bloc.dart';

@freezed
class PokemonMoveDetailsState with _$PokemonMoveDetailsState {
  const factory PokemonMoveDetailsState({
    @Default(false) bool isLoading,
    Failure? failure,
    PokemonMoveDetailsModel? pokemonMoveDetails,
  }) = _PokemonMoveDetailsState;

  factory PokemonMoveDetailsState.empty() => const PokemonMoveDetailsState();

  factory PokemonMoveDetailsState.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveDetailsStateFromJson(json);
}
