import 'package:equatable/equatable.dart';

class PokemonMovesListModel extends Equatable {
  const PokemonMovesListModel({
    required this.name,
    required this.type,
    required this.powerPoints,
    required this.accuracy,
    required this.damageClass,
    required this.pokemonCount,
  });

  factory PokemonMovesListModel.empty() => const PokemonMovesListModel(
    name: '',
    type: '',
    powerPoints: 0,
    accuracy: 0,
    damageClass: '',
    pokemonCount: null,
  );

  final String? name;
  final String? type;
  final int? powerPoints;
  final int? accuracy;
  final String? damageClass;
  final int? pokemonCount;

  @override
  List<Object?> get props => [
    name,
    type,
    powerPoints,
    accuracy,
    damageClass,
    pokemonCount,
  ];
}
