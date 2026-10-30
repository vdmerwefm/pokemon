import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/helpers/pokemon_search_helper.dart';
import 'package:pokemon_features/src/pokemon_search/domain/_barrel_domain.dart';
import 'package:pokemon_models/pokemon_models.dart';

part 'pokemon_search_events.dart';
part 'pokemon_search_state.dart';
part 'pokemon_search_bloc.freezed.dart';
part 'pokemon_search_bloc.g.dart';

@injectable
class PokemonSearchBloc extends Bloc<PokemonSearchEvents, PokemonSearchState> {
  PokemonSearchBloc(this._useCase) : super(PokemonSearchState.empty()) {
    on<OnPokemonListSearch>((event, emit) async {
      emit(state.copyWith(isPokemonListLoading: true));

      final response = await _useCase.getPokemonListSearchUseCase();

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              failure: failure,
              isPokemonListLoading: false,
            ),
          );
        },
        (response) {
          response.removeWhere((pokemon) => pokemon.id > 1250);

          final pokemonSearchList = PokemonSearchHelper.pokemonSearchHelper(
            pokemonSearchList: response,
            searchString: event.searchString,
          );
          emit(
            state.copyWith(
              pokemonList: pokemonSearchList,
              isPokemonListLoading: false,
            ),
          );
        },
      );
    });

    on<OnMoveSearchSearch>((event, emit) async {
      emit(state.copyWith(isPokemonMovesLoading: true));

      final response = await _useCase.getPokemonMoveSearchUseCase();

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              failure: failure,
              isPokemonMovesLoading: false,
            ),
          );
        },
        (response) {
          response.removeWhere(
            (move) => move.id! > 926,
          );

          final moveSearchList = PokemonSearchHelper.moveSearchHelper(
            pokemonSearchList: response,
            searchString: event.searchString,
          );
          emit(
            state.copyWith(
              pokemonMoves: moveSearchList,
              isPokemonMovesLoading: false,
            ),
          );
        },
      );
    });
  }
  final PokemonSearchUseCase _useCase;
}
