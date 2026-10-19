import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_features/src/pokemon_connectivity/domain/_barrel_domain.dart';

part 'pokemon_connectivity_bloc.freezed.dart';
part 'pokemon_connectivity_bloc.g.dart';
part 'pokemon_connectivity_events.dart';
part 'pokemon_connectivity_state.dart';

@injectable
class PokemonConnectivityBloc
    extends Bloc<PokemonConnectivityEvents, PokemonConnectivityState> {
  PokemonConnectivityBloc(this._useCase)
    : super(PokemonConnectivityState.empty()) {
      
    on<OnStartPokemonConnectivityCheck>((event, emit) async {
      await emit.forEach(
        _useCase.getPokemonConnectivityStream(),
        onData: (response) {
          return response.fold(
            (failure) => state.copyWith(
              isConnected: false,
            ),
            (connected) => state.copyWith(
              isConnected: connected,
            ),
          );
        },
        onError: (error, stackTrace) => state.copyWith(
          isConnected: false,
        ),
      );
    });
  }

  final PokemonConnectivityUseCase _useCase;
}
