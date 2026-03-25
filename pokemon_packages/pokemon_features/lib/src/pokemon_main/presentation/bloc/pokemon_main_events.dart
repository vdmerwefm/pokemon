part of 'pokemon_main_bloc.dart';

@freezed
abstract class PokemonMainEvents with _$PokemonMainEvents {
  const factory PokemonMainEvents.onGetPokemonMainThemeMp3() =
      OnGetPokemonMainThemeMp3;
}
