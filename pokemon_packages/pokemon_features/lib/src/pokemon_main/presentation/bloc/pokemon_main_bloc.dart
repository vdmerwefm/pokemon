import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_main/domain/domain_leaf.dart';

part 'pokemon_main_events.dart';
part 'pokemon_main_state.dart';
part 'pokemon_main_bloc.freezed.dart';

@injectable
class PokemonMainBloc extends Bloc<PokemonMainEvents, PokemonMainState> {
  PokemonMainBloc(this._useCase) : super(PokemonMainState.empty()) {
    on<OnPlayPokemonThemeMusic>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.playPokemonThemeMusicUseCase();

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              failure: failure,
              isLoading: false,
            ),
          );
        },
        (soundLoaded) {
          emit(
            state.copyWith(
              failure: null,
              isLoading: false,
            ),
          );
        },
      );
    });

    on<OnTogglePokemonThemeMusic>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.togglePokemonThemeMusicUseCase(
        toggleSoundHandle: !state.toggleThemeMusic,
      );

      response.fold(
        (failure) => state.copyWith(failure: failure, isLoading: false),
        (themeMusicToggled) {
          emit(
            state.copyWith(
              toggleThemeMusic: !state.toggleThemeMusic,
              isLoading: false,
              failure: null,
            ),
          );
        },
      );
    });
  }
  final GetPokemonMainUseCase _useCase;
}
