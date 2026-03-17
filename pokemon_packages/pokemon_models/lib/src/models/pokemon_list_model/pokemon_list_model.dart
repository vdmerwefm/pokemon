import 'package:equatable/equatable.dart';

class PokemonListModel extends Equatable {
  const PokemonListModel({
    required this.id,
    required this.name,
    required this.sprite,
    required this.type,
    required this.genus,
  });

  factory PokemonListModel.empty() => const PokemonListModel(
    id: 0,
    name: '',
    sprite: '',
    type: [],
    genus: '',
  );

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      PokemonListModel(
        id: json['id'] as int,
        name: json['name'] as String,
        sprite: json['sprite'] as String,
        type: json['type'] as List<String>,
        genus: json['genus'] as String,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'sprite': sprite,
    'type': type,
    'genus': genus,
  };

  final int id;
  final String name;
  final String sprite;
  final List<String> type;
  final String genus;

  @override
  List<Object?> get props => [id, name, sprite, type, genus];
}
