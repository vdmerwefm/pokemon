part of 'pokemon_connectivity_bloc.dart';

@freezed
abstract class PokemonConnectivityEvents with _$PokemonConnectivityEvents {
  factory PokemonConnectivityEvents.onStartPokemonConnectivityCheck() =
      OnStartPokemonConnectivityCheck;
}
