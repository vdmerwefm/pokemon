import 'package:equatable/equatable.dart';

class PokemonMovesListModel extends Equatable {
  const PokemonMovesListModel({
    required this.name,
    required this.type,
    required this.powerPoints,
    required this.accuracy,
    required this.damageClass,
  });

  factory PokemonMovesListModel.empty() => const PokemonMovesListModel(
    name: '',
    type: '',
    powerPoints: 0,
    accuracy: 0,
    damageClass: '',
  );

  factory PokemonMovesListModel.fromJson(Map<String, dynamic> json) =>
      PokemonMovesListModel(
        name: json['name'] as String,
        type: json['type'] as String,
        powerPoints: json['powerPoints'] as int,
        accuracy: json['accuracy'] as int,
        damageClass: json['damageClass'] as String,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type,
    'powerPoints': powerPoints,
    'accuracy': accuracy,
    'damageClass': damageClass,
  };

  final String? name;
  final String? type;
  final int? powerPoints;
  final int? accuracy;
  final String? damageClass;

  @override
  List<Object?> get props => [
    name,
    type,
    powerPoints,
    accuracy,
    damageClass,
  ];
}
