part of '../domain_leaf.dart';

@Injectable()
class GetPokemonListUseCase {
  GetPokemonListUseCase(this._repo);
  final IPokemonRepository _repo;

  Future<Either<Failure, List<PokemonListModel>>> getPokemonListUseCase() {
    return _repo.getPokemonList().run();
  }
}
