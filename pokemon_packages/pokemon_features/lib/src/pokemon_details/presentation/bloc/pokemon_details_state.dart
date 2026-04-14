part of 'pokemon_details_bloc.dart';

@freezed
class PokemonDetailsState with _$PokemonDetailsState {
  const factory PokemonDetailsState({
    PokemonDetailsModel? pokemonDetails,
    List<PokemonListTileModel>? pokemonEvolutionChain,
    List<String>? strongAgainst,
    List<String>? weakAgainst,
    @Default(false) bool damageIndeciesLoading,
    Failure? failure,
    @Default(false) bool isLoading,
    @Default(false) bool isAudioLoading,
  }) = _PokemonDetailsState;

  factory PokemonDetailsState.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsStateFromJson(json);

  factory PokemonDetailsState.empty() => const PokemonDetailsState();
}
