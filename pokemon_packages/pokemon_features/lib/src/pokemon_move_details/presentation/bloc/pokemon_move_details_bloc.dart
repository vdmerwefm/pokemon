import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/helpers/damage_indecies_helper.dart';
import 'package:pokemon_features/src/helpers/pokemon_list_helper.dart';
import 'package:pokemon_features/src/pokemon_move_details/domain/_barrel_domain.dart';
import 'package:pokemon_models/pokemon_models.dart';

part 'pokemon_move_details_state.dart';
part 'pokemon_move_details_events.dart';
part 'pokemon_move_details_bloc.freezed.dart';
part 'pokemon_move_details_bloc.g.dart';

@injectable
class PokemonMoveDetailsBloc
    extends Bloc<PokemonMoveDetailsEvents, PokemonMoveDetailsState> {
  PokemonMoveDetailsBloc(this._useCase)
    : super(PokemonMoveDetailsState.empty()) {
    on<OnGetPokemonMoveDetails>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await _useCase.getPokemonMoveDetailsUseCase(
        name: event.name,
      );

      response.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, failure: failure));
        },
        (pokemonMoveDetails) {
          final canLearnPokemon = pokemonMoveDetails.pokemon ?? [];
          final pokemonList = PokemonListHelper.canLearnList(
            canLearnPokemon,
          );
          final emptyRecords = pokemonList.length - canLearnPokemon.length;

          bool hasNextContditional;

          if (pokemonList.length > 4) {
            hasNextContditional = true;
          } else {
            hasNextContditional = false;
          }

          emit(
            state.copyWith(
              isLoading: false,
              failure: null,
              pokemonMoveDetails: pokemonMoveDetails,
              pokemonList: pokemonList,
              paginatedPokemonList: pokemonList
                  .getRange(state.offset ?? 0, 4)
                  .toList(),
              emptyRecords: emptyRecords,
              hasNext: hasNextContditional,
              hasBack: false,
            ),
          );
        },
      );
    });
    on<OnPageNextPokemonList>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final offset = (state.offset ?? 0) + 4;
      final offsetPaginatedList = state.pokemonList
          ?.getRange(offset, offset + 4)
          .toList();

      if (state.pokemonList != null) {
        if (offset != state.pokemonList!.length - 4) {
          emit(state.copyWith(hasNext: true, hasBack: true));
        } else {
          emit(state.copyWith(hasNext: false, hasBack: true));
        }

        emit(
          state.copyWith(
            isLoading: false,
            offset: offset,
            paginatedPokemonList: offsetPaginatedList,
          ),
        );
      }
    });
    on<OnPageBackPokemonList>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final offset = (state.offset ?? 0) - 4;
      final offsetPaginatedList = state.pokemonList
          ?.getRange(offset, offset + 4)
          .toList();

      if (offset != 0) {
        emit(state.copyWith(hasNext: true, hasBack: true));
      } else {
        emit(state.copyWith(hasBack: false));
      }

      emit(
        state.copyWith(
          isLoading: false,
          offset: offset,
          paginatedPokemonList: offsetPaginatedList,
        ),
      );
    });
    on<OnGetMoveDamageIndecies>((event, emit) async {
      emit(state.copyWith(damageIndeciesLoading: true));

      final response = await _useCase.getMoveDamageIndeciesUseCase(
        types: event.types,
      );

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              damageIndeciesLoading: false,
              failure: failure,
            ),
          );
        },
        (pokemonDamageIndecies) {
          final strengthsList = DamageIndeciesHelper.strongAgainstHelper(
            pokemonDamageIndecies: pokemonDamageIndecies,
          );
          final weaknessesList = DamageIndeciesHelper.weakAgainstHelper(
            pokemonDamageIndecies: pokemonDamageIndecies,
          );

          emit(
            state.copyWith(
              damageIndeciesLoading: false,
              failure: null,
              strongAgainst: strengthsList.toSet().toList(),
              weakAgainst: weaknessesList.toSet().toList(),
            ),
          );
        },
      );
    });
  }
  final PokemonMoveDetailsUseCase _useCase;
}
