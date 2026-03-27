part of '../domain_leaf.dart';

@Injectable()
class GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCase(this._repo, this._audioKit);

  final IPokemonRepository _repo;
  final IPokemonAudioKit _audioKit;

  Future<Either<Failure, PokemonDetailsModel>> getPokemonDetailsUseCase(
    String name,
  ) {
    return _repo.getPokemonDetails(name).run();
  }
  
  Future<Either<Failure, SoundHandle>> getPokemonCryUseCase(String pokemonCry) {
    return _audioKit.getPokemonCry(pokemonCry).run();
  } 
}
