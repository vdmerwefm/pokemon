part of 'pokemon_connectivity_bloc.dart';

@freezed
abstract class PokemonConnectivityEvents with _$PokemonConnectivityEvents {
  factory PokemonConnectivityEvents.onConnectivityCheckResult({required Either<Failure, bool> result}) =
      OnConnectivityCheckResult;
  factory PokemonConnectivityEvents.onStartPokemonConnectivityCheck() =
      OnStartPokemonConnectivityCheck;
  factory PokemonConnectivityEvents.onPausePokemonConnectivityCheck({required AppLifecycleState state}) =
      OnPausePokemonConnectivityCheck;

  factory PokemonConnectivityEvents.onResumePokemonConnectivityCheck({required AppLifecycleState state}) =
      OnResumePokemonConnectivityCheck;
}
