import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_core/src/error/failures.dart';

class DnsService {
  TaskEither<Failure, bool> dnsService() {
    return TaskEither.tryCatch(() async {
      final dnsSreviceResult = await InternetAddress.lookup('google.com');

      return dnsSreviceResult.isNotEmpty &&
          dnsSreviceResult.first.rawAddress.isNotEmpty;
    }, (error, stackTrace) => Failure.dnsFailure());
  }
}
