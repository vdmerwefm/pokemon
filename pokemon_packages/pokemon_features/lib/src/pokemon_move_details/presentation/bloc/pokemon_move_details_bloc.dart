import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/helpers/damage_indecies_helper.dart';
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
          emit(
            state.copyWith(
              isLoading: false,
              failure: null,
              pokemonMoveDetails: pokemonMoveDetails,
            ),
          );
        },
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
