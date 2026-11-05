part of 'pokemon_favorites_bloc.dart';

@freezed
class PokemonFavoritesState with _$PokemonFavoritesState {
  const factory PokemonFavoritesState({
    List<int>? pokemonFavoriteIndexList,
    List<PokemonListTileModel>? pokemonFavoritesList,
    Failure? failure,
    @Default(false) bool isLoading,
  }) = _PokemonFavorites;

  factory PokemonFavoritesState.fromJson(Map<String, dynamic> json) =>
      _$PokemonFavoritesStateFromJson(json);

  factory PokemonFavoritesState.empty() => const PokemonFavoritesState();
}
