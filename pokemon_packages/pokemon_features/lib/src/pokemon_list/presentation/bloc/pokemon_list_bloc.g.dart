// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonListStateImpl _$$PokemonListStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonListStateImpl(
      pokemonList: (json['pokemonList'] as List<dynamic>?)
          ?.map((e) => PokemonListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      randomPokemon: json['randomPokemon'] as String?,
      failure: json['failure'] == null
          ? null
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$PokemonListStateImplToJson(
        _$PokemonListStateImpl instance) =>
    <String, dynamic>{
      'pokemonList': instance.pokemonList,
      'randomPokemon': instance.randomPokemon,
      'failure': instance.failure,
      'isLoading': instance.isLoading,
    };
