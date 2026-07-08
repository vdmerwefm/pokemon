part of '../_barrel_domain.dart';

@Injectable()
class GetPokemonMovesListUseCase {
  GetPokemonMovesListUseCase(this._repo);
  final IPokemonRepository _repo;

  Future<Either<Failure, List<PokemonMovesListModel>>>
  getPokemonMovesListUseCase({
    required int limit,
    required int offset,
  }) {
    return _repo.getPokemonMovesList(limit: limit, offset: offset).run();
  }
}
