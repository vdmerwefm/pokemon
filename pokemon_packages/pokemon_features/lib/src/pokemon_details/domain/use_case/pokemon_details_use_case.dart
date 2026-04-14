part of '../domain_leaf.dart';

@Injectable()
class GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCase(this._repo, this._audioKit);

  final IPokemonRepository _repo;
  final IPokemonAudioKit _audioKit;

  Future<Either<Failure, PokemonDetailsModel>> getPokemonDetailsUseCase({
    required String name,
  }) {
    return _repo.getPokemonDetails(name: name).run();
  }

  Future<Either<Failure, void>> playPokemonCryUseCase({required String cry}) {
    return _audioKit.playPokemonCry(cry: cry).run();
  }

  Future<Either<Failure, List<TypeDetailsModel>>>
  getPokemonDamageIndeciesUseCase({
    required List<String> types,
  }) {
    return _repo.getPokemonDamageIndecies(types: types).run();
  }

  Future<Either<Failure, List<PokemonListTileModel>>> getPokemonEvolutionChain({
    required List<String> names,
  }) {
    return _repo.getPokemonEvolutionChainDetails(names: names).run();
  }
}
