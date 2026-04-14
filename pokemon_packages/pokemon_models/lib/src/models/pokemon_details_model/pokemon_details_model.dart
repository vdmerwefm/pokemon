import 'package:equatable/equatable.dart';
import 'package:pokemon_models/src/models/pokemon_details_model/pokemon_moves_model.dart';
import 'package:pokemon_models/src/models/pokemon_details_model/pokemon_stats_model.dart';

class PokemonDetailsModel extends Equatable {
  const PokemonDetailsModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.isDefault,
    required this.ability,
    required this.cry,
    required this.flavorText,
    required this.genus,
    required this.evolutions,
    required this.sprite,
    required this.levelUpMoves,
    required this.machineMoves,
    required this.tutorMoves,
    required this.stats,
    required this.type,
  });

  factory PokemonDetailsModel.empty() => const PokemonDetailsModel(
    id: null,
    name: '',
    height: null,
    weight: null,
    isDefault: null,
    ability: [],
    cry: '',
    flavorText: '',
    genus: '',
    evolutions: [],
    sprite: '',
    levelUpMoves: [],
    machineMoves: [],
    tutorMoves: [],
    stats: [],
    type: [],
  );

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        id: json['id'] as int,
        name: json['name'] as String,
        height: json['height'] as int,
        weight: json['weight'] as int,
        isDefault: json['isDefault'] as bool,
        ability: json['ability'] as List<String>,
        cry: json['cry'] as String,
        flavorText: json['flavorText'] as String,
        genus: json['genus'] as String,
        evolutions: json['evolutions'] as List<String>,
        sprite: json['sprite'] as String,
        levelUpMoves: json['levelUpMoves'] as List<PokemonMovesModel>,
        machineMoves: json['machineMoves'] as List<PokemonMovesModel>,
        tutorMoves: json['tutorMoves'] as List<PokemonMovesModel>,
        stats: json['stats'] as List<PokemonStatsModel>,
        type: json['type'] as List<String>,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'height': height,
    'weight': weight,
    'isDefault': isDefault,
    'ability': ability,
    'cry': cry,
    'flavorText': flavorText,
    'genus': genus,
    'evolutions': evolutions,
    'sprite': sprite,
    'levelUpMoves': levelUpMoves,
    'machineMoves': machineMoves,
    'tutorMoves': tutorMoves,
    'stats': stats,
    'type': type,
  };

  final int? id;
  final String? name;
  final int? height;
  final int? weight;
  final bool? isDefault;
  final List<String>? ability;
  final String? cry;
  final String? flavorText;
  final String? genus;
  final List<String>? evolutions;
  final String? sprite;
  final List<PokemonMovesModel>? levelUpMoves;
  final List<PokemonMovesModel>? machineMoves;
  final List<PokemonMovesModel>? tutorMoves;
  final List<PokemonStatsModel>? stats;
  final List<String>? type;

  @override
  List<Object?> get props => [
    id,
    name,
    height,
    weight,
    isDefault,
    ability,
    cry,
    flavorText,
    genus,
    evolutions,
    sprite,
    levelUpMoves,
    machineMoves,
    tutorMoves,
    stats,
    type,
  ];
}
