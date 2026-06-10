part of '../_barrel_domain.dart';

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
