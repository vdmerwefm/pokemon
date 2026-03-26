import 'package:pokemon_core/pokemon_core.dart';

class Failure {
  const Failure(this.message);

  factory Failure.httpFailure() => const HttpFailure();

  factory Failure.audioFailure() => const AudioFailure();


  factory Failure.fromJson(Map<String, dynamic> json) =>
      Failure(json['message'] as String);

  Map<String, dynamic> toJson() => {
    'message': message,
  };

  final String message;
}

@override
final class HttpFailure extends Failure {
  const HttpFailure([super.message = httpFailureMessage]);
}

final class AudioFailure extends Failure {
  const AudioFailure([super.message = audioFailureMessage]);
}
