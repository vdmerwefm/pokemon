import 'package:pokemon_core/pokemon_core.dart';

class Failure {
  const Failure(this.message);

  factory Failure.httpFailure() => const HttpFailure();

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
