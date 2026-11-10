part of 'pokemon_list_bloc.dart';

@freezed
abstract class PokemonListEvents with _$PokemonListEvents {
  const factory PokemonListEvents.onGetPokemonList({String? pokmeonFilterString}) = OnGetPokemonList;
  const factory PokemonListEvents.onLoadMorePokemon() = OnLoadMorePokemon;
}
