import 'package:equatable/equatable.dart';

class PokemonMovesModel extends Equatable {
  const PokemonMovesModel({
    required this.pokemonMoveName,
    required this.pokemonMoveType,
    required this.pokemonMoveLearnMethod,
  });

  factory PokemonMovesModel.empty() => const PokemonMovesModel(
    pokemonMoveName: '',
    pokemonMoveType: '',
    pokemonMoveLearnMethod: '',
  );

  final String pokemonMoveName;
  final String pokemonMoveType;
  final String pokemonMoveLearnMethod;

  @override
  List<Object?> get props => [
    pokemonMoveName,
    pokemonMoveType,
    pokemonMoveLearnMethod,
  ];
}
