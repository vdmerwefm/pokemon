import 'package:equatable/equatable.dart';

class PokemonListModel extends Equatable {
  const PokemonListModel({
    required this.name,
    required this.icon,
    required this.url,
  });

  factory PokemonListModel.empty() => const PokemonListModel(
    name: '',
    icon: '',
    url: '',
  );

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      PokemonListModel(
        name: json['name'] as String,
        icon: json['icon'] as String,
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'icon': icon,
    'url': url,
  };

  final String name;
  final String icon;
  final String url;

  @override
  List<Object?> get props => [name, icon, url];
}
