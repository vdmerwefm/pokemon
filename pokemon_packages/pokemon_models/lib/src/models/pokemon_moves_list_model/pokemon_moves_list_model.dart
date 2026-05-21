import 'package:equatable/equatable.dart';

class PokemonMovesListModel extends Equatable {
  const PokemonMovesListModel({
    required this.id,
    required this.name,
    required this.type,
    required this.damageClass,
  });

  factory PokemonMovesListModel.empty() => const PokemonMovesListModel(
    id: 0,
    name: '',
    type: '',
    damageClass: '',
  );

  factory PokemonMovesListModel.fromJson(Map<String, dynamic> json) =>
      PokemonMovesListModel(
        id: json['id'] as int,
        name: json['name'] as String,
        type: json['type'] as String,
        damageClass: json['damageClass'] as String,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    'damageClass': damageClass,
  };

  final int? id;
  final String? name;
  final String? type;
  final String? damageClass;

  @override
  List<Object?> get props => [
    id,
    name,
    type,
    damageClass,
  ];
}
