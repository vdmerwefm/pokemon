import 'package:freezed_annotation/freezed_annotation.dart';

part 'movedamageclassdescription.freezed.dart';
part 'movedamageclassdescription.g.dart';

@freezed
class Movedamageclassdescription with _$Movedamageclassdescription {
  factory Movedamageclassdescription({
    String? description,
  }) = _Movedamageclassdescription;

  factory Movedamageclassdescription.fromJson(Map<String, dynamic> json) =>
      _$MovedamageclassdescriptionFromJson(json);
}
