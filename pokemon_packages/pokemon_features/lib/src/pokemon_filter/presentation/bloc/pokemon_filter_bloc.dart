import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_models/pokemon_models.dart';

part 'pokemon_filter_events.dart';
part 'pokemon_filter_state.dart';
part 'pokemon_filter_bloc.freezed.dart';
part 'pokemon_filter_bloc.g.dart';

@injectable
class PokemonFilterBloc extends Bloc<PokemonFilterEvents, PokemonFilterState> {
  PokemonFilterBloc() : super(PokemonFilterState.empty()) {
    on<OnPokemonFilterChanged>((event, emit) {
      final typesList = <PokemonPromoTypes>[...PokemonPromoTypes.values];

      if (state.filterIndex != typesList.last.index) {
        emit(
          state.copyWith(
            filterIndex: (state.filterIndex) + 1,
            filterString: typesList[state.filterIndex].name,
          ),
        );
      } else {
        emit(
          state.copyWith(
            filterIndex: 0,
            filterString: 'All Types',
          ),
        );
      }
    });

    on<OnPokemonFilterReset>((event, emit) {
      emit(
        state.copyWith(
          filterIndex: 0,
          filterString: 'All Types',
        ),
      );
    });
  }
}
