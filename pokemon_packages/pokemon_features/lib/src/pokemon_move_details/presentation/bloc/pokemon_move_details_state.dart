part of 'pokemon_move_details_bloc.dart';

@freezed
class PokemonMoveDetailsState with _$PokemonMoveDetailsState {
  const factory PokemonMoveDetailsState({
    //booleans
    @Default(false) bool isLoading,
    @Default(true) bool hasNext,
    @Default(false) bool hasBack,
    @Default(false) bool damageIndeciesLoading,
    //failure
    Failure? failure,

    //pokemon_details
    PokemonMoveDetailsModel? pokemonMoveDetails,
    List<String>? strongAgainst,
    List<String>? weakAgainst,

    //pokemon_list
    List<PokemonListTileModel>? pokemonList,
    List<PokemonListTileModel>? paginatedPokemonList,
    int? emptyRecords,
    int? offset,
    
  }) = _PokemonMoveDetailsState;

  factory PokemonMoveDetailsState.empty() => const PokemonMoveDetailsState();

  factory PokemonMoveDetailsState.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveDetailsStateFromJson(json);
}
