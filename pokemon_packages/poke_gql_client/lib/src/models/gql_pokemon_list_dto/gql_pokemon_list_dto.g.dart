// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gql_pokemon_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GqlPokemonListDtoImpl _$$GqlPokemonListDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GqlPokemonListDtoImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GqlPokemonListDtoImplToJson(
        _$GqlPokemonListDtoImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
