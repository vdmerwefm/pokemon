part of '../_barrel_domain.dart';

@Injectable()
class PokemonConnectivityUseCase {
  PokemonConnectivityUseCase(this._repo);

  final IConnectivityRepository _repo;

  StreamSubscription<Either<Failure, bool>> getPokemonConnectivityCheck() {
    return _repo.startConnectivityCheckService().listen((data) => data);
  }
}
