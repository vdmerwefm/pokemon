part of 'pokemon_list_bloc.dart';

@freezed
abstract class PokemonListEvents with _$PokemonListEvents {
  const factory PokemonListEvents.onGetPokemonList() = OnGetPokemonList;
  const factory PokemonListEvents.onLoadMorePokemon() = OnLoadMorePokemon;
}
