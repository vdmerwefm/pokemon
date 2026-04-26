part of '../domain_leaf.dart';

@Injectable()
class GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCase(this._repo);

  final IPokemonRepository _repo;

  Future<Either<Failure, PokemonDetailsModel>> getPokemonDetailsUseCase({
    required String name,
  }) {
    return _repo.getPokemonDetails(name: name).run();
  }

  Future<Either<Failure, List<TypeDetailsModel>>>
  getPokemonDamageIndeciesUseCase({
    required List<String> types,
  }) {
    return _repo.getPokemonDamageIndecies(types: types).run();
  }
}
