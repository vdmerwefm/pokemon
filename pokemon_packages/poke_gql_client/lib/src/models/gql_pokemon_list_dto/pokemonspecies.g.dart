// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemonspecies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonSpeciesImpl _$$PokemonSpeciesImplFromJson(Map<String, dynamic> json) =>
    _$PokemonSpeciesImpl(
      pokemonspeciesnames: (json['pokemonspeciesnames'] as List<dynamic>?)
          ?.map((e) => Pokemonspeciesname.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokemonSpeciesImplToJson(
        _$PokemonSpeciesImpl instance) =>
    <String, dynamic>{
      'pokemonspeciesnames': instance.pokemonspeciesnames,
    };
