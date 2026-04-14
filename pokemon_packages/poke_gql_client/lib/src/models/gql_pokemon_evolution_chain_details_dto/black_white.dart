import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_evolution_chain_details_dto/animated.dart';

part 'black_white.freezed.dart';
part 'black_white.g.dart';

@freezed
class BlackWhite with _$BlackWhite {
  factory BlackWhite({
    Animated? animated,
  }) = _BlackWhite;

  factory BlackWhite.fromJson(Map<String, dynamic> json) =>
      _$BlackWhiteFromJson(json);
}
