import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_features/src/pokemon_main/domain/domain_leaf.dart';

part 'pokemon_main_events.dart';
part 'pokemon_main_state.dart';
part 'pokemon_main_bloc.freezed.dart';

@injectable
class PokemonMainBloc extends Bloc<PokemonMainEvents, PokemonMainState> {
  PokemonMainBloc(this._useCase) : super(PokemonMainState.empty()) {
    on<OnMainPlaceHolderEvent>((event, emit) async {
      _useCase.toString();
      emit(state.copyWith(isLoading: false));
    });
  }
  final GetPokemonMainUseCase _useCase;
}
