import 'package:equatable/equatable.dart';

class TypeDetailsModel extends Equatable {
  const TypeDetailsModel({
    required this.strongAgainst,
    required this.weakAgainst,
  });

  factory TypeDetailsModel.empty() => const TypeDetailsModel(
    strongAgainst: [],
    weakAgainst: [],
    
  );

  factory TypeDetailsModel.fromJson(Map<String, dynamic> json) =>
      TypeDetailsModel(
        strongAgainst: json['strongAgainst'] as List<String>,
        weakAgainst: json['weakAgainst'] as List<String>,
      );

  Map<String, dynamic> toJson() => {
    'strongAgainst': strongAgainst,
    'weakAgainst': weakAgainst,
  };

  final List<String> strongAgainst;
  final List<String> weakAgainst;

  @override
  List<Object?> get props => [strongAgainst, weakAgainst];
}
