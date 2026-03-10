import 'package:bloc/bloc.dart';

part 'pokemon_list_events.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvents,PokemonListState> {
  PokemonListBloc(super.initialState);
}
