part of '../_barrel_domain.dart';

@Injectable()
class PokemonSearchUseCase {
  const PokemonSearchUseCase(this._repo);

  final IPokemonRepository _repo;

  Future<Either<Failure, List<PokemonListTileModel>>>
  getPokemonListSearchUseCase() {
    return _repo.getPokemonList().run();
  }

  Future<Either<Failure, List<PokemonMovesListModel>>>
  getPokemonMoveSearchUseCase() {
    return _repo.getPokemonMovesList().run();
  }
}
