import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_features/src/pokemon_details/domain/domain_leaf.dart';
import 'package:pokemon_models/pokemon_models.dart';

part 'pokemon_details_events.dart';
part 'pokemon_details_state.dart';
part 'pokemon_details_bloc.freezed.dart';
part 'pokemon_details_bloc.g.dart';

@injectable
class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvents, PokemonDetailsState> {
  PokemonDetailsBloc(this._useCase) : super(PokemonDetailsState.empty()) {
    on<OnGetPokemonDetails>((event, emit) async {
      final response = await _useCase.getPokemonDetailsUseCase(
        name: event.name,
      );

      await response.fold(
        (failure) {
          emit(
            state.copyWith(
              failure: failure,
              isLoading: false,
            ),
          );
        },
        (pokemon) async {
          emit(
            state.copyWith(
              isLoading: false,
              pokemonDetails: pokemon,
            ),
          );
        },
      );
    });

    on<OnGetPokemonEvolutionChain>(
      (event, emit) async {
        final response = await _useCase.getPokemonEvolutionChain(
          names: state.pokemonDetails?.evolutions ?? [],
        );

        response.fold(
          (failure) => emit(
            state.copyWith(
              failure: failure,
            ),
          ),
          (evolutionChain) => emit(
            state.copyWith(pokemonEvolutionChain: evolutionChain),
          ),
        );
      },
    );

    on<OnGetPokemonCry>((event, emit) async {
      emit(state.copyWith(isAudioLoading: true));
      if (state.pokemonDetails != null) {
        final response = await _useCase.playPokemonCryUseCase(
          cry: state.pokemonDetails!.cry!,
        );

        response.fold(
          (failure) => state.copyWith(
            failure: failure,
            isAudioLoading: false,
          ),
          (pokemonCry) => state.copyWith(
            failure: null,
            isAudioLoading: false,
          ),
        );
      }
    });

    on<OnGetPokemonDamageIndecies>(
      (event, emit) async {
        emit(state.copyWith(damageIndeciesLoading: true));
        final response = await _useCase.getPokemonDamageIndeciesUseCase(
          types: event.types,
        );

        response.fold(
          (failure) {
            emit(
              state.copyWith(failure: failure, damageIndeciesLoading: false),
            );
          },
          (pokemonDamageIndecies) {
            final strengthsList = [
              ...pokemonDamageIndecies
                  .map((damageIndex) => damageIndex.strongAgainst)
                  .first,
              ...pokemonDamageIndecies
                  .map((damageIndex) => damageIndex.strongAgainst)
                  .last,
            ];
            final weaknessesList = [
              ...pokemonDamageIndecies
                  .map((damageIndex) => damageIndex.weakAgainst)
                  .first,
              ...pokemonDamageIndecies
                  .map((damageIndex) => damageIndex.weakAgainst)
                  .last,
            ];
            emit(
              state.copyWith(
                damageIndeciesLoading: false,
                strongAgainst: strengthsList.toSet().toList(),
                weakAgainst: weaknessesList.toSet().toList(),
              ),
            );
          },
        );
      },
    );
  }
  final GetPokemonDetailsUseCase _useCase;
}
