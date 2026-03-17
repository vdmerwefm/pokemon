// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      pokemontypes: (json['pokemontypes'] as List<dynamic>?)
          ?.map((e) => Pokemontype.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonsprites: (json['pokemonsprites'] as List<dynamic>?)
          ?.map((e) => Pokemonsprite.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonspecy: json['pokemonspecy'] == null
          ? null
          : Pokemonspecy.fromJson(json['pokemonspecy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pokemontypes': instance.pokemontypes,
      'pokemonsprites': instance.pokemonsprites,
      'pokemonspecy': instance.pokemonspecy,
    };
