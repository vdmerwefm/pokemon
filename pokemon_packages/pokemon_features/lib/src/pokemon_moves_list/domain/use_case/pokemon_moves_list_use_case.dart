part of '../domain_leaf.dart';

@Injectable()
class GetPokemonMovesListUseCase {
  GetPokemonMovesListUseCase(this._repo);
  final IPokemonRepository _repo;

  Future<Either<Failure, List<PokemonMovesListModel>>>
  getPokemonMovesListUseCase() {
    return _repo.getPokemonMovesList().run();
  }
}
