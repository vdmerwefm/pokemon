import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_list/domain/domain_leaf.dart';
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
      final response = await _useCase.getPokemonListUseCase(
        limit: state.limit,
        offset: state.offset,
      );

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
            ),
          );
        },
      );
    });

    on<OnLoadMorePokemon>((event, emit) async {
      final offset = state.offset + 9;
      const limit = 9;

      emit(state.copyWith(isLoadingMorePokemon: true));

      final response = await _useCase.getPokemonListUseCase(
        limit: limit,
        offset: offset,
      );

      response.fold(
        (failure) {
          emit(state.copyWith(failure: failure, isLoadingMorePokemon: false));
        },
        (morePokemon) {
          final pokemonList = List<PokemonListModel>.from(
            state.pokemonList!,
          );

          emit(
            state.copyWith(
              isLoadingMorePokemon: false,
              pokemonList: [
                ...pokemonList,
                ...morePokemon,
              ],
              limit: limit,
              offset: offset,
            ),
          );
        },
      );
    });
  }
  final GetPokemonListUseCase _useCase;
}
