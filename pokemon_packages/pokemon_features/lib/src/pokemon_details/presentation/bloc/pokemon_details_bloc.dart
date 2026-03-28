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
      final response = await _useCase.getPokemonDetailsUseCase(event.name);

      response.fold(
        (failure) {
          emit(
            state.copyWith(
              failure: failure,
              isLoading: false,
            ),
          );
        },
        (pokemon) {
          emit(
            state.copyWith(
              isLoading: false,
              pokemonDetails: pokemon,
            ),
          );
        },
      );
    });

    on<OnGetPokemonCry>((event, emit) async {
      emit(state.copyWith(isAudioLoading: true));
      if (state.pokemonDetails != null) {
        final response = await _useCase.playPokemonCryUseCase(
          state.pokemonDetails!.cry!,
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
  }
  final GetPokemonDetailsUseCase _useCase;
}
