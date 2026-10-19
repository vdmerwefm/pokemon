part of 'pokemon_connectivity_bloc.dart';

@freezed
class PokemonConnectivityState with _$PokemonConnectivityState {
  const factory PokemonConnectivityState({
    @Default(true) bool isConnected,
  }) = _PokemonConnectivityState;

  factory PokemonConnectivityState.fromJson(Map<String, dynamic> json) =>
      _$PokemonConnectivityStateFromJson(json);

  factory PokemonConnectivityState.empty() => const PokemonConnectivityState();
}
