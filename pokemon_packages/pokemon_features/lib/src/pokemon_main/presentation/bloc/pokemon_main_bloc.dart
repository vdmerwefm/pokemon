import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
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
    on<OnGetPokemonMainThemeMp3>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));

        final response = await _useCase.getPokemonMainThemeUseCase();
        await SoLoud.instance.play(
          response,
          looping: true,
          volume: 0.5);

      } on Exception catch (error) {
        emit(state.copyWith(failure: Failure.httpFailure().message != ''));
      }
    });
  }
  final GetPokemonMainUseCase _useCase;
}
