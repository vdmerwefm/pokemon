part of 'pokemon_favorites_bloc.dart';

@freezed
abstract class PokemonFavoritesEvents with _$PokemonFavoritesEvents {
  const factory PokemonFavoritesEvents.onGetPokemonFavoritesList() =
      OnGetPokemonFavoritesList;
  const factory PokemonFavoritesEvents.onGetHydratedFavorites() =
      OnGetHydratedFavorites;
  const factory PokemonFavoritesEvents.onTogglePokemonFavorites({required int pokemonId}) =
      OnTogglePokemonFavorites;
}
