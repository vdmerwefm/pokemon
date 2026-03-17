// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return _Pokemon.fromJson(json);
}

/// @nodoc
mixin _$Pokemon {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<Pokemontype>? get pokemontypes => throw _privateConstructorUsedError;
  List<Pokemonsprite>? get pokemonsprites => throw _privateConstructorUsedError;

  /// Serializes this Pokemon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonCopyWith<Pokemon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res, Pokemon>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      List<Pokemontype>? pokemontypes,
      List<Pokemonsprite>? pokemonsprites});
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res, $Val extends Pokemon>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? pokemontypes = freezed,
    Object? pokemonsprites = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemontypes: freezed == pokemontypes
          ? _value.pokemontypes
          : pokemontypes // ignore: cast_nullable_to_non_nullable
              as List<Pokemontype>?,
      pokemonsprites: freezed == pokemonsprites
          ? _value.pokemonsprites
          : pokemonsprites // ignore: cast_nullable_to_non_nullable
              as List<Pokemonsprite>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonImplCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$$PokemonImplCopyWith(
          _$PokemonImpl value, $Res Function(_$PokemonImpl) then) =
      __$$PokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      List<Pokemontype>? pokemontypes,
      List<Pokemonsprite>? pokemonsprites});
}

/// @nodoc
class __$$PokemonImplCopyWithImpl<$Res>
    extends _$PokemonCopyWithImpl<$Res, _$PokemonImpl>
    implements _$$PokemonImplCopyWith<$Res> {
  __$$PokemonImplCopyWithImpl(
      _$PokemonImpl _value, $Res Function(_$PokemonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? pokemontypes = freezed,
    Object? pokemonsprites = freezed,
  }) {
    return _then(_$PokemonImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemontypes: freezed == pokemontypes
          ? _value._pokemontypes
          : pokemontypes // ignore: cast_nullable_to_non_nullable
              as List<Pokemontype>?,
      pokemonsprites: freezed == pokemonsprites
          ? _value._pokemonsprites
          : pokemonsprites // ignore: cast_nullable_to_non_nullable
              as List<Pokemonsprite>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonImpl implements _Pokemon {
  _$PokemonImpl(
      {this.id,
      this.name,
      final List<Pokemontype>? pokemontypes,
      final List<Pokemonsprite>? pokemonsprites})
      : _pokemontypes = pokemontypes,
        _pokemonsprites = pokemonsprites;

  factory _$PokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  final List<Pokemontype>? _pokemontypes;
  @override
  List<Pokemontype>? get pokemontypes {
    final value = _pokemontypes;
    if (value == null) return null;
    if (_pokemontypes is EqualUnmodifiableListView) return _pokemontypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Pokemonsprite>? _pokemonsprites;
  @override
  List<Pokemonsprite>? get pokemonsprites {
    final value = _pokemonsprites;
    if (value == null) return null;
    if (_pokemonsprites is EqualUnmodifiableListView) return _pokemonsprites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, pokemontypes: $pokemontypes, pokemonsprites: $pokemonsprites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._pokemontypes, _pokemontypes) &&
            const DeepCollectionEquality()
                .equals(other._pokemonsprites, _pokemonsprites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_pokemontypes),
      const DeepCollectionEquality().hash(_pokemonsprites));

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      __$$PokemonImplCopyWithImpl<_$PokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonImplToJson(
      this,
    );
  }
}

abstract class _Pokemon implements Pokemon {
  factory _Pokemon(
      {final int? id,
      final String? name,
      final List<Pokemontype>? pokemontypes,
      final List<Pokemonsprite>? pokemonsprites}) = _$PokemonImpl;

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$PokemonImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<Pokemontype>? get pokemontypes;
  @override
  List<Pokemonsprite>? get pokemonsprites;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
