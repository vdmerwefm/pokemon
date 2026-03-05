import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api_client/src/dtos/raw_pokemon_details_dto/item.dart';


part 'held_item.freezed.dart';
part 'held_item.g.dart';

@freezed
class HeldItem with _$HeldItem {
  factory HeldItem({
    Item? item,
  }) = _HeldItem;

  factory HeldItem.fromJson(Map<String, dynamic> json) =>
      _$HeldItemFromJson(json);
}
