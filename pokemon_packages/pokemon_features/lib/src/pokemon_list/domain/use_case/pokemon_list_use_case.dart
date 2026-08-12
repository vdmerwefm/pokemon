part of '../_barrel_domain.dart';

@Injectable()
class GetPokemonListUseCase {
  GetPokemonListUseCase(this._repo);
  final IPokemonRepository _repo;

  Future<Either<Failure, List<PokemonListTileModel>>> getPokemonListUseCase() {
    return _repo.getPokemonList().run();
  }
}
