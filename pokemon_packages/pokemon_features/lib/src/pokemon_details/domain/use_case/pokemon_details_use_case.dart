part of '../domain_leaf.dart';

@Injectable()
class GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCase(this._repo);

  final IPokemonRepository _repo;

  Future<Either<Failure, PokemonDetailsModel>> getPokemonDetailsUseCase(
    String name,
  ) {
    return _repo.getPokemonDetails(name).run();
  }
}
