// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemontype.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pokemontype _$PokemontypeFromJson(Map<String, dynamic> json) {
  return _Pokemontype.fromJson(json);
}

/// @nodoc
mixin _$Pokemontype {
  Map<String, dynamic>? get type => throw _privateConstructorUsedError;

  /// Serializes this Pokemontype to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemontype
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemontypeCopyWith<Pokemontype> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemontypeCopyWith<$Res> {
  factory $PokemontypeCopyWith(
          Pokemontype value, $Res Function(Pokemontype) then) =
      _$PokemontypeCopyWithImpl<$Res, Pokemontype>;
  @useResult
  $Res call({Map<String, dynamic>? type});
}

/// @nodoc
class _$PokemontypeCopyWithImpl<$Res, $Val extends Pokemontype>
    implements $PokemontypeCopyWith<$Res> {
  _$PokemontypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemontype
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemontypeImplCopyWith<$Res>
    implements $PokemontypeCopyWith<$Res> {
  factory _$$PokemontypeImplCopyWith(
          _$PokemontypeImpl value, $Res Function(_$PokemontypeImpl) then) =
      __$$PokemontypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic>? type});
}

/// @nodoc
class __$$PokemontypeImplCopyWithImpl<$Res>
    extends _$PokemontypeCopyWithImpl<$Res, _$PokemontypeImpl>
    implements _$$PokemontypeImplCopyWith<$Res> {
  __$$PokemontypeImplCopyWithImpl(
      _$PokemontypeImpl _value, $Res Function(_$PokemontypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pokemontype
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$PokemontypeImpl(
      type: freezed == type
          ? _value._type
          : type // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemontypeImpl implements _Pokemontype {
  _$PokemontypeImpl({final Map<String, dynamic>? type}) : _type = type;

  factory _$PokemontypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemontypeImplFromJson(json);

  final Map<String, dynamic>? _type;
  @override
  Map<String, dynamic>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableMapView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Pokemontype(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemontypeImpl &&
            const DeepCollectionEquality().equals(other._type, _type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_type));

  /// Create a copy of Pokemontype
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemontypeImplCopyWith<_$PokemontypeImpl> get copyWith =>
      __$$PokemontypeImplCopyWithImpl<_$PokemontypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemontypeImplToJson(
      this,
    );
  }
}

abstract class _Pokemontype implements Pokemontype {
  factory _Pokemontype({final Map<String, dynamic>? type}) = _$PokemontypeImpl;

  factory _Pokemontype.fromJson(Map<String, dynamic> json) =
      _$PokemontypeImpl.fromJson;

  @override
  Map<String, dynamic>? get type;

  /// Create a copy of Pokemontype
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemontypeImplCopyWith<_$PokemontypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
