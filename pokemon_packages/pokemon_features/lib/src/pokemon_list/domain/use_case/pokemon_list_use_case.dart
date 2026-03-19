part of '../domain_leaf.dart';

@Injectable()
class GetPokemonListUseCase {
  GetPokemonListUseCase(this._repo);
  final IPokemonRepository _repo;

  Future<Either<Failure, List<PokemonListModel>>> getPokemonListUseCase({
    required int limit,
    required int offset,
  }) {
    return _repo.getPokemonList(limit: limit, offset: offset).run();
  }
}
