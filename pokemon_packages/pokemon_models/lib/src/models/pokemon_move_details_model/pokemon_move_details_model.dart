import 'package:equatable/equatable.dart';
import 'package:pokemon_models/src/models/pokemon_list_tile_model/pokemon_list_tile_model.dart';

class PokemonMoveDetailsModel extends Equatable {
  const PokemonMoveDetailsModel({
    required this.id,
    required this.name,
    required this.type,
    required this.moveFlavorText,
    required this.power,
    required this.accuracy,
    required this.pp,
    required this.moveDamageClass,
    required this.ailment,
    required this.effect,
    required this.machines,
    required this.versionGroup,
    required this.pokemon,
  });

  factory PokemonMoveDetailsModel.empty() => const PokemonMoveDetailsModel(
    id: 0,
    name: '',
    type: '',
    moveFlavorText: '',
    power: 0,
    accuracy: 0,
    pp: 0,
    moveDamageClass: '',
    ailment: '',
    effect: '',
    machines: '',
    versionGroup: [],
    pokemon: [],
  );

  factory PokemonMoveDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonMoveDetailsModel(
        id: json['id'] as int,
        name: json['name'] as String,
        type: json['type'] as String,
        moveFlavorText: json['moveFlavorText'] as String,
        power: json['power'] as int,
        accuracy: json['accuracy'] as int,
        pp: json['pp'] as int,
        moveDamageClass: json['moveDamageClass'] as String,
        ailment: json['ailment'] as String,
        effect: json['effect'] as String,
        machines: json['machines'] as String,
        versionGroup: json['versionGroup'] as List<String>,
        pokemon: json['pokemon'] as List<PokemonListTileModel>,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    'moveFlavorText': moveFlavorText,
    'power': power,
    'accuracy': accuracy,
    'pp': pp,
    'moveDamageClass': moveDamageClass,
    'ailment': ailment,
    'effect': effect,
    'machines': machines,
    'versionGroup': versionGroup,
    'pokemon': pokemon,
  };

  final int? id;
  final String? name;
  final String? type;
  final String? moveFlavorText;
  final int? power;
  final int? accuracy;
  final int? pp;
  final String? moveDamageClass;
  final String? ailment;
  final String? effect;
  final String? machines;
  final List<String>? versionGroup;
  final List<PokemonListTileModel>? pokemon;

  @override
  List<Object?> get props => [
    id,
    name,
    type,
    moveFlavorText,
    power,
    accuracy,
    pp,
    moveDamageClass,
    ailment,
    effect,
    machines,
    versionGroup,
    pokemon,
  ];
}
