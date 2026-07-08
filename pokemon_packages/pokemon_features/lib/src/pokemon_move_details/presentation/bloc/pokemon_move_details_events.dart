part of 'pokemon_move_details_bloc.dart';

@freezed
abstract class PokemonMoveDetailsEvents with _$PokemonMoveDetailsEvents {
  const factory PokemonMoveDetailsEvents.onGetPokemonMoveDetails({
    required String name,
  }) = OnGetPokemonMoveDetails;
  const factory PokemonMoveDetailsEvents.onGetMoveDamageIndecies({
    required List<String> types,
  }) = OnGetMoveDamageIndecies;
}
