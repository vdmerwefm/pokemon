part of '../_barrel_domain.dart';

@Injectable()
class PokemonFavoritesUseCase {
  const PokemonFavoritesUseCase(this._repo);

  Future<Either<Failure, List<PokemonListTileModel>>> getPokmeonFavoritesList() {
    return _repo.getPokemonList().run();
  }
  final IPokemonRepository _repo;
}
