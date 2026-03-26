import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_features/src/pokemon_main/domain/domain_leaf.dart';

part 'pokemon_main_events.dart';
part 'pokemon_main_state.dart';
part 'pokemon_main_bloc.freezed.dart';

@injectable
class PokemonMainBloc extends Bloc<PokemonMainEvents, PokemonMainState> {
  PokemonMainBloc(this._useCase) : super(PokemonMainState.empty()) {
    on<OnGetPokemonMainThemeMp3>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.getPokemonMainThemeUseCase();

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              failure: true,
              isLoading: false,
              soundLoaded: false,
            ),
          );
        },
        (soundLoaded) {
          emit(
            state.copyWith(
              failure: true,
              isLoading: false,
              soundLoaded: true,
            ),
          );
        },
      );
    });
  }
  final GetPokemonMainUseCase _useCase;
}
