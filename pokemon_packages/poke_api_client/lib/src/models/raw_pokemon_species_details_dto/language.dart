import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';

@freezed
class Language with _$Language {
  factory Language({
    String? name,
    String? url,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  factory Language.empty() => Language(
    name: '',
    url: '',
  );
}
