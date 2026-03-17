// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemonspeciesname.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pokemonspeciesname _$PokemonspeciesnameFromJson(Map<String, dynamic> json) {
  return _Pokemonspeciesname.fromJson(json);
}

/// @nodoc
mixin _$Pokemonspeciesname {
  String? get genus => throw _privateConstructorUsedError;

  /// Serializes this Pokemonspeciesname to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemonspeciesname
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonspeciesnameCopyWith<Pokemonspeciesname> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonspeciesnameCopyWith<$Res> {
  factory $PokemonspeciesnameCopyWith(
          Pokemonspeciesname value, $Res Function(Pokemonspeciesname) then) =
      _$PokemonspeciesnameCopyWithImpl<$Res, Pokemonspeciesname>;
  @useResult
  $Res call({String? genus});
}

/// @nodoc
class _$PokemonspeciesnameCopyWithImpl<$Res, $Val extends Pokemonspeciesname>
    implements $PokemonspeciesnameCopyWith<$Res> {
  _$PokemonspeciesnameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemonspeciesname
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genus = freezed,
  }) {
    return _then(_value.copyWith(
      genus: freezed == genus
          ? _value.genus
          : genus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonspeciesnameImplCopyWith<$Res>
    implements $PokemonspeciesnameCopyWith<$Res> {
  factory _$$PokemonspeciesnameImplCopyWith(_$PokemonspeciesnameImpl value,
          $Res Function(_$PokemonspeciesnameImpl) then) =
      __$$PokemonspeciesnameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? genus});
}

/// @nodoc
class __$$PokemonspeciesnameImplCopyWithImpl<$Res>
    extends _$PokemonspeciesnameCopyWithImpl<$Res, _$PokemonspeciesnameImpl>
    implements _$$PokemonspeciesnameImplCopyWith<$Res> {
  __$$PokemonspeciesnameImplCopyWithImpl(_$PokemonspeciesnameImpl _value,
      $Res Function(_$PokemonspeciesnameImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pokemonspeciesname
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genus = freezed,
  }) {
    return _then(_$PokemonspeciesnameImpl(
      genus: freezed == genus
          ? _value.genus
          : genus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonspeciesnameImpl implements _Pokemonspeciesname {
  _$PokemonspeciesnameImpl({this.genus});

  factory _$PokemonspeciesnameImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonspeciesnameImplFromJson(json);

  @override
  final String? genus;

  @override
  String toString() {
    return 'Pokemonspeciesname(genus: $genus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonspeciesnameImpl &&
            (identical(other.genus, genus) || other.genus == genus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, genus);

  /// Create a copy of Pokemonspeciesname
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonspeciesnameImplCopyWith<_$PokemonspeciesnameImpl> get copyWith =>
      __$$PokemonspeciesnameImplCopyWithImpl<_$PokemonspeciesnameImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonspeciesnameImplToJson(
      this,
    );
  }
}

abstract class _Pokemonspeciesname implements Pokemonspeciesname {
  factory _Pokemonspeciesname({final String? genus}) = _$PokemonspeciesnameImpl;

  factory _Pokemonspeciesname.fromJson(Map<String, dynamic> json) =
      _$PokemonspeciesnameImpl.fromJson;

  @override
  String? get genus;

  /// Create a copy of Pokemonspeciesname
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonspeciesnameImplCopyWith<_$PokemonspeciesnameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
