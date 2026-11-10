part of 'pokemon_filter_bloc.dart';

@freezed
abstract class PokemonFilterEvents with _$PokemonFilterEvents {
  const factory PokemonFilterEvents.onPokemonFilterChanged() =
      OnPokemonFilterChanged;
  const factory PokemonFilterEvents.onPokemonFilterReset() =
      OnPokemonFilterReset;
}
