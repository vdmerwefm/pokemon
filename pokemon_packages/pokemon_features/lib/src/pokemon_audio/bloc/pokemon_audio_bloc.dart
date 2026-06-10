import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_audio/domain/_barrel_domain.dart';

part 'pokemon_audio_events.dart';
part 'pokemon_audio_state.dart';
part 'pokemon_audio_bloc.freezed.dart';
part 'pokemon_audio_bloc.g.dart';

@injectable
class PokemonAudioBloc extends Bloc<PokemonAudioEvents, PokemonAudioState> {
  PokemonAudioBloc(this._useCase) : super(PokemonAudioState.empty()) {
    on<OnPlayPokemonThemeMusic>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.playPokemonThemeMusicUseCase();

      response.fold(
        (failure) => emit(
          state.copyWith(
            failure: failure,
            isLoading: false,
          ),
        ),
        (soundLoaded) => emit(
          state.copyWith(
            failure: null,
            isLoading: false,
          ),
        ),
      );
    });

    on<OnTogglePokemonThemeMusic>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.togglePokemonThemeMusicUseCase(
        toggleSoundHandle:
            event.pausePokemonThemeMusic ?? !state.toggleThemeMusic,
      );

      response.fold(
        (failure) => emit(
          state.copyWith(
            failure: failure,
            isLoading: false,
          ),
        ),
        (themeMusicToggled) => emit(
          state.copyWith(
            toggleThemeMusic:
                event.pausePokemonThemeMusic ?? !state.toggleThemeMusic,
            isLoading: false,
            failure: null,
          ),
        ),
      );
    });

    on<OnPlayPokemonCry>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.playPokemonCryUseCase(
        cry: event.pokemonCry,
      );

      response.fold(
        (failure) => emit(
          state.copyWith(
            failure: failure,
            isLoading: false,
          ),
        ),
        (pokemonCry) => emit(
          state.copyWith(
            failure: null,
            isLoading: false,
          ),
        ),
      );
    });

    on<OnPlaySelectBite>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.playSelectUseCase();

      response.fold(
        (failure) => emit(
          state.copyWith(
            failure: failure,
            isLoading: false,
          ),
        ),
        (pokemonCry) => emit(
          state.copyWith(
            failure: null,
            isLoading: false,
          ),
        ),
      );
    });
  }
  final GetPokemonAudioUseCase _useCase;
}
