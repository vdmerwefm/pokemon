import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/helpers/pokemon_list_helper.dart';
import 'package:pokemon_features/src/pokemon_favorites/domain/_barrel_domain.dart';
import 'package:pokemon_models/pokemon_models.dart';

part 'pokemon_favorites_event.dart';
part 'pokemon_favorites_state.dart';
part 'pokemon_favorites_bloc.g.dart';
part 'pokemon_favorites_bloc.freezed.dart';

@injectable
class PokemonFavoritesBloc
    extends HydratedBloc<PokemonFavoritesEvents, PokemonFavoritesState> {
  PokemonFavoritesBloc(this._useCase) : super(PokemonFavoritesState.empty()) {
    on<OnGetPokemonFavoritesList>(
      (event, emit) async {
        final response = await _useCase.getPokmeonFavoritesList();

        response.fold(
          (failure) {
            emit(
              state.copyWith(
                isLoading: false,
                failure: failure,
              ),
            );
          },
          (pokemonFavorites) {
            final pokemonFavoritesList = PokemonListHelper.favortiesList(
              state.pokemonFavoriteIndexList,
              pokemonFavorites,
            );
            emit(
              state.copyWith(
                isLoading: false,
                pokemonFavoritesList: pokemonFavoritesList,
              ),
            );
          },
        );
      },
    );
    on<OnGetHydratedFavorites>(
      (event, emit) {
        emit(
          state.copyWith(
            pokemonFavoriteIndexList: state.pokemonFavoriteIndexList,
            isLoading: false,
          ),
        );
      },
    );
    on<OnTogglePokemonFavorites>(
      (event, emit) {
        final modifiableList = List<int>.from(
          (state.pokemonFavoriteIndexList ?? <int>[]).toList(),
        );

        if (modifiableList.contains(event.pokemonId)) {
          modifiableList.remove(event.pokemonId);
        } else {
          modifiableList.add(event.pokemonId);
        }


        emit(
          state.copyWith(
            pokemonFavoriteIndexList: modifiableList,
            isLoading: false,
          ),
        );
      },
    );
  }
  @override
  PokemonFavoritesState? fromJson(Map<String, dynamic> json) {
    return PokemonFavoritesState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PokemonFavoritesState pokemonFavoritesState) {
    return pokemonFavoritesState.toJson();
  }

  final PokemonFavoritesUseCase _useCase;
}
