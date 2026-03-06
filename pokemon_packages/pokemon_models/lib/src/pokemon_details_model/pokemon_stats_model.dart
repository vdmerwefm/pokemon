import 'package:equatable/equatable.dart';

class PokemonStatsModel extends Equatable {
  const PokemonStatsModel({
    required this.baseStat,
    required this.statName,
  });

  final int baseStat;
  final String statName;

  @override
  List<Object?> get props => [
    baseStat,
    statName,
  ];
}
