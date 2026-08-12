import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_list/domain/_barrel_domain.dart';
import 'package:pokemon_models/pokemon_models.dart';

part 'pokemon_list_events.dart';
part 'pokemon_list_state.dart';
part 'pokemon_list_bloc.freezed.dart';
part 'pokemon_list_bloc.g.dart';

@injectable
class PokemonListBloc extends Bloc<PokemonListEvents, PokemonListState> {
  PokemonListBloc(this._useCase) : super(PokemonListState.empty()) {
    on<OnGetPokemonList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final response = await _useCase.getPokemonListUseCase();

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              failure: failure,
              isLoading: false,
            ),
          );
        },
        (pokemonList) {
          emit(
            state.copyWith(
              isLoading: false,
              pokemonList: pokemonList,
              paginatedPokemonList: pokemonList
                  .getRange(0, state.limit)
                  .toList(),
            ),
          );
        },
      );
    });

    on<OnLoadMorePokemon>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoadingMorePokemon: true,
            limit: state.limit + 25,
          ),
        );

        if (state.paginatedPokemonList!.length <= 1000) {
          emit(
            state.copyWith(
              failure: null,
              isLoadingMorePokemon: false,
              paginatedPokemonList: state.pokemonList
                  ?.getRange(0, state.limit)
                  .toList(),
            ),
          );
        }

        if (state.paginatedPokemonList?.length == 1025) {
          emit(
            state.copyWith(
              failure: null,
              dexLimit: true,
            ),
          );
        }
      },
    );
  }
  final GetPokemonListUseCase _useCase;
}
