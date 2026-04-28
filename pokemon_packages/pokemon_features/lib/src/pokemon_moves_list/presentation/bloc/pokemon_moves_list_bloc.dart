import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_features/src/pokemon_moves_list/domain/domain_leaf.dart';

part 'pokemon_moves_list_state.dart';
part 'pokemon_moves_list_events.dart';
part 'pokemon_moves_list_bloc.freezed.dart';
part 'pokemon_moves_list_bloc.g.dart';

@injectable
class PokemonMovesListBloc
    extends Bloc<PokemonMovesListEvents, PokemonMovesListState> {
  PokemonMovesListBloc(this._useCase) : super(PokemonMovesListState.empty()) {
    on<OnGetPokemonMovesList>((event, emit) => throw UnimplementedError());
  }
  final GetPokemonMovesListUseCase _useCase;
}
