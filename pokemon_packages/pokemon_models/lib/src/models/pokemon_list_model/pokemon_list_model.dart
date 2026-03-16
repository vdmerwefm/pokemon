import 'package:equatable/equatable.dart';

class PokemonListModel extends Equatable {
  const PokemonListModel({
    required this.name,
    required this.sprite,
    required this.url,
  });

  factory PokemonListModel.empty() => const PokemonListModel(
    name: '',
    sprite: '',
    url: '',
  );

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      PokemonListModel(
        name: json['name'] as String,
        sprite: json['sprite'] as String,
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'sprite': sprite,
    'url': url,
  };

  final String name;
  final String sprite;
  final String url;

  @override
  List<Object?> get props => [name, sprite, url];
}
