// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemonsprite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pokemonsprite _$PokemonspriteFromJson(Map<String, dynamic> json) {
  return _Pokemonsprite.fromJson(json);
}

/// @nodoc
mixin _$Pokemonsprite {
  Map<String, dynamic>? get sprites => throw _privateConstructorUsedError;

  /// Serializes this Pokemonsprite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemonsprite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonspriteCopyWith<Pokemonsprite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonspriteCopyWith<$Res> {
  factory $PokemonspriteCopyWith(
          Pokemonsprite value, $Res Function(Pokemonsprite) then) =
      _$PokemonspriteCopyWithImpl<$Res, Pokemonsprite>;
  @useResult
  $Res call({Map<String, dynamic>? sprites});
}

/// @nodoc
class _$PokemonspriteCopyWithImpl<$Res, $Val extends Pokemonsprite>
    implements $PokemonspriteCopyWith<$Res> {
  _$PokemonspriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemonsprite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sprites = freezed,
  }) {
    return _then(_value.copyWith(
      sprites: freezed == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonspriteImplCopyWith<$Res>
    implements $PokemonspriteCopyWith<$Res> {
  factory _$$PokemonspriteImplCopyWith(
          _$PokemonspriteImpl value, $Res Function(_$PokemonspriteImpl) then) =
      __$$PokemonspriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? sprites});
}

/// @nodoc
class __$$PokemonspriteImplCopyWithImpl<$Res>
    extends _$PokemonspriteCopyWithImpl<$Res, _$PokemonspriteImpl>
    implements _$$PokemonspriteImplCopyWith<$Res> {
  __$$PokemonspriteImplCopyWithImpl(
      _$PokemonspriteImpl _value, $Res Function(_$PokemonspriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pokemonsprite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sprites = freezed,
  }) {
    return _then(_$PokemonspriteImpl(
      sprites: freezed == sprites
          ? _value._sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonspriteImpl implements _Pokemonsprite {
  _$PokemonspriteImpl({final Map<String, dynamic>? sprites})
      : _sprites = sprites;

  factory _$PokemonspriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonspriteImplFromJson(json);

  final Map<String, dynamic>? _sprites;
  @override
  Map<String, dynamic>? get sprites {
    final value = _sprites;
    if (value == null) return null;
    if (_sprites is EqualUnmodifiableMapView) return _sprites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Pokemonsprite(sprites: $sprites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonspriteImpl &&
            const DeepCollectionEquality().equals(other._sprites, _sprites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sprites));

  /// Create a copy of Pokemonsprite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonspriteImplCopyWith<_$PokemonspriteImpl> get copyWith =>
      __$$PokemonspriteImplCopyWithImpl<_$PokemonspriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonspriteImplToJson(
      this,
    );
  }
}

abstract class _Pokemonsprite implements Pokemonsprite {
  factory _Pokemonsprite({final Map<String, dynamic>? sprites}) =
      _$PokemonspriteImpl;

  factory _Pokemonsprite.fromJson(Map<String, dynamic> json) =
      _$PokemonspriteImpl.fromJson;

  @override
  Map<String, dynamic>? get sprites;

  /// Create a copy of Pokemonsprite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonspriteImplCopyWith<_$PokemonspriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
