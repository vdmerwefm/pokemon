import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/item.dart';
import 'package:poke_gql_client/src/models/gql_pokemon_move_details_dto/versiongroup.dart';

part 'machine.freezed.dart';
part 'machine.g.dart';

@freezed
class Machine with _$Machine {
  factory Machine({
    Item? item,
    Versiongroup? versiongroup,
  }) = _Machine;

  factory Machine.fromJson(Map<String, dynamic> json) =>
      _$MachineFromJson(json);
}
