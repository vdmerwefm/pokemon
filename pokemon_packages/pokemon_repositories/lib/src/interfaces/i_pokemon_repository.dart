import 'package:fpdart/fpdart.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_models/pokemon_models.dart';

abstract interface class IPokemonRepository {
  TaskEither<Failure, List<PokemonListModel>> getPokemonList({
    required int limit,
    required int offset,
  });
  TaskEither<Failure, PokemonDetailsModel> getPokemonDetails(String name);
  TaskEither<Failure, TypeDetailsModel> getTypeDetails(String typeName);
}
