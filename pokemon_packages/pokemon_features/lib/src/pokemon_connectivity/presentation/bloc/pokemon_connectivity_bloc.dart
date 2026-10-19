import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
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

    _connectivitySubsciption = _useCase.getPokemonConnectivityCheck();

    _connectivitySubsciption?.onData((result) {
        add(OnConnectivityCheckResult(result: result));
      });

    on<OnConnectivityCheckResult>((event, emit) {
      event.result.fold(
        (failure) => emit(state.copyWith(isConnected: false)),
        (connected) => emit(state.copyWith(isConnected: connected)),
      );
    });

    on<OnStartPokemonConnectivityCheck>((event, emit) async {
      _connectivitySubsciption?.resume();
    });

    on<OnPausePokemonConnectivityCheck>((event, emit) {
      _connectivitySubsciption?.pause();
    });

    on<OnResumePokemonConnectivityCheck>((event, emit) {
      _connectivitySubsciption?.resume();
    });
  }

  @override
  Future<void> close() async {
    await _connectivitySubsciption?.cancel();
    return super.close();
  }

  final PokemonConnectivityUseCase _useCase;
  StreamSubscription<Either<Failure, bool>>? _connectivitySubsciption;
}
