// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PokemonListEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetPokemonList,
    required TResult Function() onGetRandomPokemon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetPokemonList,
    TResult? Function()? onGetRandomPokemon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetPokemonList,
    TResult Function()? onGetRandomPokemon,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetPokemonList value) onGetPokemonList,
    required TResult Function(OnGetRandomPokemon value) onGetRandomPokemon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetPokemonList value)? onGetPokemonList,
    TResult? Function(OnGetRandomPokemon value)? onGetRandomPokemon,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetPokemonList value)? onGetPokemonList,
    TResult Function(OnGetRandomPokemon value)? onGetRandomPokemon,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListEventsCopyWith<$Res> {
  factory $PokemonListEventsCopyWith(
    PokemonListEvents value,
    $Res Function(PokemonListEvents) then,
  ) = _$PokemonListEventsCopyWithImpl<$Res, PokemonListEvents>;
}

/// @nodoc
class _$PokemonListEventsCopyWithImpl<$Res, $Val extends PokemonListEvents>
    implements $PokemonListEventsCopyWith<$Res> {
  _$PokemonListEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnGetPokemonListImplCopyWith<$Res> {
  factory _$$OnGetPokemonListImplCopyWith(
    _$OnGetPokemonListImpl value,
    $Res Function(_$OnGetPokemonListImpl) then,
  ) = __$$OnGetPokemonListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnGetPokemonListImplCopyWithImpl<$Res>
    extends _$PokemonListEventsCopyWithImpl<$Res, _$OnGetPokemonListImpl>
    implements _$$OnGetPokemonListImplCopyWith<$Res> {
  __$$OnGetPokemonListImplCopyWithImpl(
    _$OnGetPokemonListImpl _value,
    $Res Function(_$OnGetPokemonListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonListEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnGetPokemonListImpl implements OnGetPokemonList {
  const _$OnGetPokemonListImpl();

  @override
  String toString() {
    return 'PokemonListEvents.onGetPokemonList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnGetPokemonListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetPokemonList,
    required TResult Function() onGetRandomPokemon,
  }) {
    return onGetPokemonList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetPokemonList,
    TResult? Function()? onGetRandomPokemon,
  }) {
    return onGetPokemonList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetPokemonList,
    TResult Function()? onGetRandomPokemon,
    required TResult orElse(),
  }) {
    if (onGetPokemonList != null) {
      return onGetPokemonList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetPokemonList value) onGetPokemonList,
    required TResult Function(OnGetRandomPokemon value) onGetRandomPokemon,
  }) {
    return onGetPokemonList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetPokemonList value)? onGetPokemonList,
    TResult? Function(OnGetRandomPokemon value)? onGetRandomPokemon,
  }) {
    return onGetPokemonList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetPokemonList value)? onGetPokemonList,
    TResult Function(OnGetRandomPokemon value)? onGetRandomPokemon,
    required TResult orElse(),
  }) {
    if (onGetPokemonList != null) {
      return onGetPokemonList(this);
    }
    return orElse();
  }
}

abstract class OnGetPokemonList implements PokemonListEvents {
  const factory OnGetPokemonList() = _$OnGetPokemonListImpl;
}

/// @nodoc
abstract class _$$OnGetRandomPokemonImplCopyWith<$Res> {
  factory _$$OnGetRandomPokemonImplCopyWith(
    _$OnGetRandomPokemonImpl value,
    $Res Function(_$OnGetRandomPokemonImpl) then,
  ) = __$$OnGetRandomPokemonImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnGetRandomPokemonImplCopyWithImpl<$Res>
    extends _$PokemonListEventsCopyWithImpl<$Res, _$OnGetRandomPokemonImpl>
    implements _$$OnGetRandomPokemonImplCopyWith<$Res> {
  __$$OnGetRandomPokemonImplCopyWithImpl(
    _$OnGetRandomPokemonImpl _value,
    $Res Function(_$OnGetRandomPokemonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonListEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnGetRandomPokemonImpl implements OnGetRandomPokemon {
  const _$OnGetRandomPokemonImpl();

  @override
  String toString() {
    return 'PokemonListEvents.onGetRandomPokemon()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnGetRandomPokemonImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetPokemonList,
    required TResult Function() onGetRandomPokemon,
  }) {
    return onGetRandomPokemon();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetPokemonList,
    TResult? Function()? onGetRandomPokemon,
  }) {
    return onGetRandomPokemon?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetPokemonList,
    TResult Function()? onGetRandomPokemon,
    required TResult orElse(),
  }) {
    if (onGetRandomPokemon != null) {
      return onGetRandomPokemon();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetPokemonList value) onGetPokemonList,
    required TResult Function(OnGetRandomPokemon value) onGetRandomPokemon,
  }) {
    return onGetRandomPokemon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetPokemonList value)? onGetPokemonList,
    TResult? Function(OnGetRandomPokemon value)? onGetRandomPokemon,
  }) {
    return onGetRandomPokemon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetPokemonList value)? onGetPokemonList,
    TResult Function(OnGetRandomPokemon value)? onGetRandomPokemon,
    required TResult orElse(),
  }) {
    if (onGetRandomPokemon != null) {
      return onGetRandomPokemon(this);
    }
    return orElse();
  }
}

abstract class OnGetRandomPokemon implements PokemonListEvents {
  const factory OnGetRandomPokemon() = _$OnGetRandomPokemonImpl;
}

PokemonListState _$PokemonListStateFromJson(Map<String, dynamic> json) {
  return _PokemonListState.fromJson(json);
}

/// @nodoc
mixin _$PokemonListState {
  List<PokemonListModel>? get pokemonList => throw _privateConstructorUsedError;
  String? get randomPokemon => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this PokemonListState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListStateCopyWith<PokemonListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListStateCopyWith<$Res> {
  factory $PokemonListStateCopyWith(
    PokemonListState value,
    $Res Function(PokemonListState) then,
  ) = _$PokemonListStateCopyWithImpl<$Res, PokemonListState>;
  @useResult
  $Res call({
    List<PokemonListModel>? pokemonList,
    String? randomPokemon,
    Failure? failure,
    bool isLoading,
  });
}

/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res, $Val extends PokemonListState>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonList = freezed,
    Object? randomPokemon = freezed,
    Object? failure = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            pokemonList: freezed == pokemonList
                ? _value.pokemonList
                : pokemonList // ignore: cast_nullable_to_non_nullable
                      as List<PokemonListModel>?,
            randomPokemon: freezed == randomPokemon
                ? _value.randomPokemon
                : randomPokemon // ignore: cast_nullable_to_non_nullable
                      as String?,
            failure: freezed == failure
                ? _value.failure
                : failure // ignore: cast_nullable_to_non_nullable
                      as Failure?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonListStateImplCopyWith<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  factory _$$PokemonListStateImplCopyWith(
    _$PokemonListStateImpl value,
    $Res Function(_$PokemonListStateImpl) then,
  ) = __$$PokemonListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<PokemonListModel>? pokemonList,
    String? randomPokemon,
    Failure? failure,
    bool isLoading,
  });
}

/// @nodoc
class __$$PokemonListStateImplCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res, _$PokemonListStateImpl>
    implements _$$PokemonListStateImplCopyWith<$Res> {
  __$$PokemonListStateImplCopyWithImpl(
    _$PokemonListStateImpl _value,
    $Res Function(_$PokemonListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonList = freezed,
    Object? randomPokemon = freezed,
    Object? failure = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$PokemonListStateImpl(
        pokemonList: freezed == pokemonList
            ? _value._pokemonList
            : pokemonList // ignore: cast_nullable_to_non_nullable
                  as List<PokemonListModel>?,
        randomPokemon: freezed == randomPokemon
            ? _value.randomPokemon
            : randomPokemon // ignore: cast_nullable_to_non_nullable
                  as String?,
        failure: freezed == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListStateImpl implements _PokemonListState {
  const _$PokemonListStateImpl({
    final List<PokemonListModel>? pokemonList,
    this.randomPokemon,
    this.failure,
    this.isLoading = false,
  }) : _pokemonList = pokemonList;

  factory _$PokemonListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListStateImplFromJson(json);

  final List<PokemonListModel>? _pokemonList;
  @override
  List<PokemonListModel>? get pokemonList {
    final value = _pokemonList;
    if (value == null) return null;
    if (_pokemonList is EqualUnmodifiableListView) return _pokemonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? randomPokemon;
  @override
  final Failure? failure;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'PokemonListState(pokemonList: $pokemonList, randomPokemon: $randomPokemon, failure: $failure, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListStateImpl &&
            const DeepCollectionEquality().equals(
              other._pokemonList,
              _pokemonList,
            ) &&
            (identical(other.randomPokemon, randomPokemon) ||
                other.randomPokemon == randomPokemon) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pokemonList),
    randomPokemon,
    failure,
    isLoading,
  );

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListStateImplCopyWith<_$PokemonListStateImpl> get copyWith =>
      __$$PokemonListStateImplCopyWithImpl<_$PokemonListStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListStateImplToJson(
      this,
    );
  }
}

abstract class _PokemonListState implements PokemonListState {
  const factory _PokemonListState({
    final List<PokemonListModel>? pokemonList,
    final String? randomPokemon,
    final Failure? failure,
    final bool isLoading,
  }) = _$PokemonListStateImpl;

  factory _PokemonListState.fromJson(Map<String, dynamic> json) =
      _$PokemonListStateImpl.fromJson;

  @override
  List<PokemonListModel>? get pokemonList;
  @override
  String? get randomPokemon;
  @override
  Failure? get failure;
  @override
  bool get isLoading;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListStateImplCopyWith<_$PokemonListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
