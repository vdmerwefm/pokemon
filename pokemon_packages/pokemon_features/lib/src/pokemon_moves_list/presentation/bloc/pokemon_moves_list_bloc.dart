import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_moves_list/domain/_barrel_domain.dart';
import 'package:pokemon_models/pokemon_models.dart';

part 'pokemon_moves_list_state.dart';
part 'pokemon_moves_list_events.dart';
part 'pokemon_moves_list_bloc.freezed.dart';
part 'pokemon_moves_list_bloc.g.dart';

@injectable
class PokemonMovesListBloc
    extends Bloc<PokemonMovesListEvents, PokemonMovesListState> {
  PokemonMovesListBloc(this._useCase) : super(PokemonMovesListState.empty()) {
    on<OnGetPokemonMovesList>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.getPokemonMovesListUseCase(
        limit: state.limit,
        offset: state.offset,
      );

      response.fold(
        (failure) => emit(
          state.copyWith(
            failure: failure,
            isLoading: false,
          ),
        ),
        (pokemonMovesList) => emit(
          state.copyWith(
            failure: null,
            isLoading: false,
            pokemonMovesList: pokemonMovesList,
          ),
        ),
      );
    });
  }
  final GetPokemonMovesListUseCase _useCase;
}
