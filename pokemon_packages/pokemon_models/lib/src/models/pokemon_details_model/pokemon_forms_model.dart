import 'package:equatable/equatable.dart';

class PokemonFormsModel extends Equatable {
  const PokemonFormsModel({
    required this.id,
    required this.name,
    required this.formName,
    required this.genus,
    required this.types,
    required this.sprite,
  });

  factory PokemonFormsModel.empty() => const PokemonFormsModel(
    id: 0,
    name: '',
    formName: '',
    genus: '',
    types: [],
    sprite: '',
  );

  final int id;
  final String name;
  final String formName;
  final String genus;
  final List<String> types;
  final String sprite;

  @override
  List<Object?> get props => [
    id,
    name,
    formName,
    genus,
    types,
    sprite,
  ];
}
