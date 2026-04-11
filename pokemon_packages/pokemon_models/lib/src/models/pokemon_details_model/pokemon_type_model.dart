import 'package:equatable/equatable.dart';
import 'package:pokemon_models/pokemon_models.dart';

class PokemonTypeModel extends Equatable {
  const PokemonTypeModel({
    required this.type,
  });

  final String? type;

  @override
  List<Object?> get props => [
    type,
  ];
}
