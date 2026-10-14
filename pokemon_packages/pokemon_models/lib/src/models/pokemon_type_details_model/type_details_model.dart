import 'package:equatable/equatable.dart';

class PokemonTypeDetailsModel extends Equatable {
  const PokemonTypeDetailsModel({
    required this.strongAgainst,
    required this.weakAgainst,
  });

  factory PokemonTypeDetailsModel.empty() => const PokemonTypeDetailsModel(
    strongAgainst: [],
    weakAgainst: [],
  );

  factory PokemonTypeDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeDetailsModel(
        strongAgainst: json['strongAgainst'] as List<String>,
        weakAgainst: json['weakAgainst'] as List<String>,
      );

  Map<String, dynamic> toJson() => {
    'strongAgainst': strongAgainst,
    'weakAgainst': weakAgainst,
  };

  final List<String> strongAgainst;
  final List<String> weakAgainst;

  @override
  List<Object?> get props => [strongAgainst, weakAgainst];
}
