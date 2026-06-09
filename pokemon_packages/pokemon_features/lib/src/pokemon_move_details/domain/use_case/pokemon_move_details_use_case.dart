part of '../domain_leaf.dart';

@Injectable()
class PokemonMoveDetailsUseCase {
  const PokemonMoveDetailsUseCase(this._repo);
  final IPokemonRepository _repo;

  Future<Either<Failure, PokemonMoveDetailsModel>>
  getPokemonMoveDetailsUseCase({
    required String name,
  }) {
    return _repo.getPokemonMovesDetails(name: name).run();
  }
}
