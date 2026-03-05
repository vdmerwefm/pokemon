import 'package:pokemon_core/pokemon_core.dart';

class Failure {
  const Failure(this.message);

  factory Failure.httpFailure() => const HttpFailure();

  final String message;
}

@override
final class HttpFailure extends Failure {
  const HttpFailure([super.message = httpFailureMessage]);
}
