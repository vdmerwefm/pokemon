import 'package:equatable/equatable.dart';

class PokemonMovesModel extends Equatable {
  const PokemonMovesModel({
    required this.pokemonMoveName,
    required this.pokemonMoveType,
    this.pokemonMoveLevel,
    this.pokemonMoveLearnMethod,
  });

  factory PokemonMovesModel.empty() => const PokemonMovesModel(
    pokemonMoveLevel: 0,
    pokemonMoveName: '',
    pokemonMoveType: '',
    pokemonMoveLearnMethod: '',
  );
  final int? pokemonMoveLevel;
  final String pokemonMoveName;
  final String pokemonMoveType;
  final String? pokemonMoveLearnMethod;

  @override
  List<Object?> get props => [
    pokemonMoveLevel,
    pokemonMoveName,
    pokemonMoveType,
    pokemonMoveLearnMethod,
  ];
}
