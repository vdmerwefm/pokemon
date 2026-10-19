part of '../_barrel_domain.dart';

@Injectable()
class PokemonConnectivityUseCase {
  PokemonConnectivityUseCase(this._repo);

  final IConnectivityRepository _repo;

  Stream<Either<Failure, bool>> getPokemonConnectivityStream() {
    return _repo.getConnectivityStatus();
  }
}
