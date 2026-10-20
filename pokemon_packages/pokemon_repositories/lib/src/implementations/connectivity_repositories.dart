import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/pokemon_core.dart';
import 'package:pokemon_repositories/src/interfaces/i_connectivity_repository.dart';

@Injectable(as: IConnectivityRepository)
class ConnectivityRepository implements IConnectivityRepository {
  const ConnectivityRepository(this._connectivityService);

  final ConnectivityService _connectivityService;

  @override
  Stream<Either<Failure, bool>> startConnectivityCheckService() async* {
    yield await _connectivityService.connectivityService().run();
    yield* Stream<Either<Failure, bool>>.periodic(
      const Duration(seconds: 2),
      (computationCount) => Left(Failure.connectionFailure()),
    ).asyncMap((_) async => _connectivityService.connectivityService().run());
  }
}
