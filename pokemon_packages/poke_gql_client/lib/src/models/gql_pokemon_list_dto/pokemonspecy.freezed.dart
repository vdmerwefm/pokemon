// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemonspecy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pokemonspecy _$PokemonspecyFromJson(Map<String, dynamic> json) {
  return _Pokemonspecy.fromJson(json);
}

/// @nodoc
mixin _$Pokemonspecy {
  List<Pokemonspecy>? get pokemonspecy => throw _privateConstructorUsedError;
  List<PokemonSpecies>? get pokemonspecies =>
      throw _privateConstructorUsedError;

  /// Serializes this Pokemonspecy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemonspecy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonspecyCopyWith<Pokemonspecy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonspecyCopyWith<$Res> {
  factory $PokemonspecyCopyWith(
          Pokemonspecy value, $Res Function(Pokemonspecy) then) =
      _$PokemonspecyCopyWithImpl<$Res, Pokemonspecy>;
  @useResult
  $Res call(
      {List<Pokemonspecy>? pokemonspecy, List<PokemonSpecies>? pokemonspecies});
}

/// @nodoc
class _$PokemonspecyCopyWithImpl<$Res, $Val extends Pokemonspecy>
    implements $PokemonspecyCopyWith<$Res> {
  _$PokemonspecyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemonspecy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonspecy = freezed,
    Object? pokemonspecies = freezed,
  }) {
    return _then(_value.copyWith(
      pokemonspecy: freezed == pokemonspecy
          ? _value.pokemonspecy
          : pokemonspecy // ignore: cast_nullable_to_non_nullable
              as List<Pokemonspecy>?,
      pokemonspecies: freezed == pokemonspecies
          ? _value.pokemonspecies
          : pokemonspecies // ignore: cast_nullable_to_non_nullable
              as List<PokemonSpecies>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonspecyImplCopyWith<$Res>
    implements $PokemonspecyCopyWith<$Res> {
  factory _$$PokemonspecyImplCopyWith(
          _$PokemonspecyImpl value, $Res Function(_$PokemonspecyImpl) then) =
      __$$PokemonspecyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Pokemonspecy>? pokemonspecy, List<PokemonSpecies>? pokemonspecies});
}

/// @nodoc
class __$$PokemonspecyImplCopyWithImpl<$Res>
    extends _$PokemonspecyCopyWithImpl<$Res, _$PokemonspecyImpl>
    implements _$$PokemonspecyImplCopyWith<$Res> {
  __$$PokemonspecyImplCopyWithImpl(
      _$PokemonspecyImpl _value, $Res Function(_$PokemonspecyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pokemonspecy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonspecy = freezed,
    Object? pokemonspecies = freezed,
  }) {
    return _then(_$PokemonspecyImpl(
      pokemonspecy: freezed == pokemonspecy
          ? _value._pokemonspecy
          : pokemonspecy // ignore: cast_nullable_to_non_nullable
              as List<Pokemonspecy>?,
      pokemonspecies: freezed == pokemonspecies
          ? _value._pokemonspecies
          : pokemonspecies // ignore: cast_nullable_to_non_nullable
              as List<PokemonSpecies>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonspecyImpl implements _Pokemonspecy {
  _$PokemonspecyImpl(
      {final List<Pokemonspecy>? pokemonspecy,
      final List<PokemonSpecies>? pokemonspecies})
      : _pokemonspecy = pokemonspecy,
        _pokemonspecies = pokemonspecies;

  factory _$PokemonspecyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonspecyImplFromJson(json);

  final List<Pokemonspecy>? _pokemonspecy;
  @override
  List<Pokemonspecy>? get pokemonspecy {
    final value = _pokemonspecy;
    if (value == null) return null;
    if (_pokemonspecy is EqualUnmodifiableListView) return _pokemonspecy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PokemonSpecies>? _pokemonspecies;
  @override
  List<PokemonSpecies>? get pokemonspecies {
    final value = _pokemonspecies;
    if (value == null) return null;
    if (_pokemonspecies is EqualUnmodifiableListView) return _pokemonspecies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Pokemonspecy(pokemonspecy: $pokemonspecy, pokemonspecies: $pokemonspecies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonspecyImpl &&
            const DeepCollectionEquality()
                .equals(other._pokemonspecy, _pokemonspecy) &&
            const DeepCollectionEquality()
                .equals(other._pokemonspecies, _pokemonspecies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pokemonspecy),
      const DeepCollectionEquality().hash(_pokemonspecies));

  /// Create a copy of Pokemonspecy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonspecyImplCopyWith<_$PokemonspecyImpl> get copyWith =>
      __$$PokemonspecyImplCopyWithImpl<_$PokemonspecyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonspecyImplToJson(
      this,
    );
  }
}

abstract class _Pokemonspecy implements Pokemonspecy {
  factory _Pokemonspecy(
      {final List<Pokemonspecy>? pokemonspecy,
      final List<PokemonSpecies>? pokemonspecies}) = _$PokemonspecyImpl;

  factory _Pokemonspecy.fromJson(Map<String, dynamic> json) =
      _$PokemonspecyImpl.fromJson;

  @override
  List<Pokemonspecy>? get pokemonspecy;
  @override
  List<PokemonSpecies>? get pokemonspecies;

  /// Create a copy of Pokemonspecy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonspecyImplCopyWith<_$PokemonspecyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
