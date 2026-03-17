// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonDetailsStateImpl _$$PokemonDetailsStateImplFromJson(
  Map<String, dynamic> json,
) => _$PokemonDetailsStateImpl(
  pokemonDetails: json['pokemonDetails'] == null
      ? null
      : PokemonDetailsModel.fromJson(
          json['pokemonDetails'] as Map<String, dynamic>,
        ),
  failure: json['failure'] == null
      ? null
      : Failure.fromJson(json['failure'] as Map<String, dynamic>),
  isLoading: json['isLoading'] as bool? ?? false,
);

Map<String, dynamic> _$$PokemonDetailsStateImplToJson(
  _$PokemonDetailsStateImpl instance,
) => <String, dynamic>{
  'pokemonDetails': instance.pokemonDetails,
  'failure': instance.failure,
  'isLoading': instance.isLoading,
};
