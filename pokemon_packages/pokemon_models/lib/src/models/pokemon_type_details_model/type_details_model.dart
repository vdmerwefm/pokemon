import 'package:equatable/equatable.dart';

class PokemonTypeDetailsModel extends Equatable {
  const PokemonTypeDetailsModel({
    required this.strongAgainst,
    required this.weakAgainst,
    required this.moveWeakAgainst,
  });

  factory PokemonTypeDetailsModel.empty() => const PokemonTypeDetailsModel(
    strongAgainst: [],
    weakAgainst: [],
    moveWeakAgainst: [],
  );

  factory PokemonTypeDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeDetailsModel(
        strongAgainst: json['strongAgainst'] as List<String>,
        weakAgainst: json['weakAgainst'] as List<String>,
        moveWeakAgainst: json['moveWeakAgaist'] as List<String>,
      );

  Map<String, dynamic> toJson() => {
    'strongAgainst': strongAgainst,
    'weakAgainst': weakAgainst,
    'moveWeakAgainst': moveWeakAgainst,
  };

  final List<String> strongAgainst;
  final List<String> weakAgainst;
  final List<String> moveWeakAgainst;

  @override
  List<Object?> get props => [strongAgainst, weakAgainst, moveWeakAgainst];
}
