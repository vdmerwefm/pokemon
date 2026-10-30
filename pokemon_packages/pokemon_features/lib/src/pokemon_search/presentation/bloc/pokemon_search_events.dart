part of 'pokemon_search_bloc.dart';

@freezed
abstract class PokemonSearchEvents with _$PokemonSearchEvents {
  const factory PokemonSearchEvents.onPokemonListSearch({
    String? searchString,
  }) = OnPokemonListSearch;
  const factory PokemonSearchEvents.onPokemonMoveSearch({
    String? searchString,
  }) = OnMoveSearchSearch;
}
