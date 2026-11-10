part of 'pokemon_moves_list_bloc.dart';

@freezed
abstract class PokemonMovesListEvents with _$PokemonMovesListEvents {
  const factory PokemonMovesListEvents.onGetPokemonMovesList({String? pokmeonFilterString}) =
      OnGetPokemonMovesList;
  const factory PokemonMovesListEvents.onLoadMorePokemonMoves() =
      OnLoadMorePokemonMoves;
}
