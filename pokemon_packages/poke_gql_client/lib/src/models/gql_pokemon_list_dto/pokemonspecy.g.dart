// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemonspecy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonspecyImpl _$$PokemonspecyImplFromJson(Map<String, dynamic> json) =>
    _$PokemonspecyImpl(
      pokemonspecy: (json['pokemonspecy'] as List<dynamic>?)
          ?.map((e) => Pokemonspecy.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonspecies: (json['pokemonspecies'] as List<dynamic>?)
          ?.map((e) => PokemonSpecies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonspecyImplToJson(_$PokemonspecyImpl instance) =>
    <String, dynamic>{
      'pokemonspecy': instance.pokemonspecy,
      'pokemonspecies': instance.pokemonspecies,
    };
