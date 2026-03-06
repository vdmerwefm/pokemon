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
  
  final String name;
  final String icon;
  final String url;

  @override
  List<Object?> get props => [name, icon, url];
}
