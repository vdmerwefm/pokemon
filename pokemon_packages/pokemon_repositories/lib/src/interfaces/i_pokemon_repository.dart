import 'package:fpdart/fpdart.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_models/pokemon_models.dart';

abstract interface class IPokemonRepository {
  TaskEither<Failure, List<PokemonListTileModel>> getPokemonList({
    required int limit,
    required int offset,
  });
  TaskEither<Failure, PokemonDetailsModel> getPokemonDetails({
    required String name,
  });
  TaskEither<Failure, List<TypeDetailsModel>> getPokemonDamageIndecies({
    required List<String> types,
  });
  TaskEither<Failure, List<PokemonMovesListModel>> getPokemonMovesList({
    required int limit,
    required int offset,
  });
  TaskEither<Failure, PokemonMoveDetailsModel> getPokemonMovesDetails({
    required String name,
  });
}
