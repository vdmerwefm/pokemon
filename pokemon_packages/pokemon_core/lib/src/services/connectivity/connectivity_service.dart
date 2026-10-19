import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_core/src/error/failures.dart';
import 'package:pokemon_core/src/services/dns/dns_service.dart';

@injectable
class ConnectivityService {
  TaskEither<Failure, bool> connectivityService() {
    return TaskEither.tryCatch(() async {
      final connectivityServiceResult = await Connectivity()
          .checkConnectivity();

      final connectionServiceType = connectivityServiceResult.firstOrNull;

      final isConnected = switch (connectionServiceType) {
        ConnectivityResult.wifi => true,
        ConnectivityResult.mobile => true,
        ConnectivityResult.satellite => true,
        _ => false,
      };

      if (!isConnected) {
        return false;
      }

      return DnsService().dnsService().getOrElse((_) => false).run();
    }, (error, stackTrace) => Failure.connectionFailure());
  }
}
