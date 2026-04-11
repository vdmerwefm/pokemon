import 'package:equatable/equatable.dart';

class PokemonStatsModel extends Equatable {
  const PokemonStatsModel({
    required this.baseStat,
    required this.statName,
  });

  factory PokemonStatsModel.empty() => const PokemonStatsModel(
    baseStat: 0,
    statName: '',
  );

  final int baseStat;
  final String statName;

  @override
  List<Object?> get props => [
    baseStat,
    statName,
  ];
}
