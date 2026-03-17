// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PokemonDetailsEvents {
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) onGetPokemonDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? onGetPokemonDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? onGetPokemonDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetPokemonDetails value) onGetPokemonDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetPokemonDetails value)? onGetPokemonDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetPokemonDetails value)? onGetPokemonDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetailsEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailsEventsCopyWith<PokemonDetailsEvents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsEventsCopyWith<$Res> {
  factory $PokemonDetailsEventsCopyWith(
    PokemonDetailsEvents value,
    $Res Function(PokemonDetailsEvents) then,
  ) = _$PokemonDetailsEventsCopyWithImpl<$Res, PokemonDetailsEvents>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$PokemonDetailsEventsCopyWithImpl<
  $Res,
  $Val extends PokemonDetailsEvents
>
    implements $PokemonDetailsEventsCopyWith<$Res> {
  _$PokemonDetailsEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetailsEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnGetPokemonDetailsImplCopyWith<$Res>
    implements $PokemonDetailsEventsCopyWith<$Res> {
  factory _$$OnGetPokemonDetailsImplCopyWith(
    _$OnGetPokemonDetailsImpl value,
    $Res Function(_$OnGetPokemonDetailsImpl) then,
  ) = __$$OnGetPokemonDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$OnGetPokemonDetailsImplCopyWithImpl<$Res>
    extends _$PokemonDetailsEventsCopyWithImpl<$Res, _$OnGetPokemonDetailsImpl>
    implements _$$OnGetPokemonDetailsImplCopyWith<$Res> {
  __$$OnGetPokemonDetailsImplCopyWithImpl(
    _$OnGetPokemonDetailsImpl _value,
    $Res Function(_$OnGetPokemonDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonDetailsEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(
      _$OnGetPokemonDetailsImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OnGetPokemonDetailsImpl implements OnGetPokemonDetails {
  const _$OnGetPokemonDetailsImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'PokemonDetailsEvents.onGetPokemonDetails(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnGetPokemonDetailsImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PokemonDetailsEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnGetPokemonDetailsImplCopyWith<_$OnGetPokemonDetailsImpl> get copyWith =>
      __$$OnGetPokemonDetailsImplCopyWithImpl<_$OnGetPokemonDetailsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) onGetPokemonDetails,
  }) {
    return onGetPokemonDetails(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? onGetPokemonDetails,
  }) {
    return onGetPokemonDetails?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? onGetPokemonDetails,
    required TResult orElse(),
  }) {
    if (onGetPokemonDetails != null) {
      return onGetPokemonDetails(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnGetPokemonDetails value) onGetPokemonDetails,
  }) {
    return onGetPokemonDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnGetPokemonDetails value)? onGetPokemonDetails,
  }) {
    return onGetPokemonDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnGetPokemonDetails value)? onGetPokemonDetails,
    required TResult orElse(),
  }) {
    if (onGetPokemonDetails != null) {
      return onGetPokemonDetails(this);
    }
    return orElse();
  }
}

abstract class OnGetPokemonDetails implements PokemonDetailsEvents {
  const factory OnGetPokemonDetails({required final String name}) =
      _$OnGetPokemonDetailsImpl;

  @override
  String get name;

  /// Create a copy of PokemonDetailsEvents
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnGetPokemonDetailsImplCopyWith<_$OnGetPokemonDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonDetailsState _$PokemonDetailsStateFromJson(Map<String, dynamic> json) {
  return _PokemonDetailsState.fromJson(json);
}

/// @nodoc
mixin _$PokemonDetailsState {
  PokemonDetailsModel? get pokemonDetails => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this PokemonDetailsState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailsStateCopyWith<PokemonDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsStateCopyWith<$Res> {
  factory $PokemonDetailsStateCopyWith(
    PokemonDetailsState value,
    $Res Function(PokemonDetailsState) then,
  ) = _$PokemonDetailsStateCopyWithImpl<$Res, PokemonDetailsState>;
  @useResult
  $Res call({
    PokemonDetailsModel? pokemonDetails,
    Failure? failure,
    bool isLoading,
  });
}

/// @nodoc
class _$PokemonDetailsStateCopyWithImpl<$Res, $Val extends PokemonDetailsState>
    implements $PokemonDetailsStateCopyWith<$Res> {
  _$PokemonDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonDetails = freezed,
    Object? failure = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            pokemonDetails: freezed == pokemonDetails
                ? _value.pokemonDetails
                : pokemonDetails // ignore: cast_nullable_to_non_nullable
                      as PokemonDetailsModel?,
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
abstract class _$$PokemonDetailsStateImplCopyWith<$Res>
    implements $PokemonDetailsStateCopyWith<$Res> {
  factory _$$PokemonDetailsStateImplCopyWith(
    _$PokemonDetailsStateImpl value,
    $Res Function(_$PokemonDetailsStateImpl) then,
  ) = __$$PokemonDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PokemonDetailsModel? pokemonDetails,
    Failure? failure,
    bool isLoading,
  });
}

/// @nodoc
class __$$PokemonDetailsStateImplCopyWithImpl<$Res>
    extends _$PokemonDetailsStateCopyWithImpl<$Res, _$PokemonDetailsStateImpl>
    implements _$$PokemonDetailsStateImplCopyWith<$Res> {
  __$$PokemonDetailsStateImplCopyWithImpl(
    _$PokemonDetailsStateImpl _value,
    $Res Function(_$PokemonDetailsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonDetails = freezed,
    Object? failure = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$PokemonDetailsStateImpl(
        pokemonDetails: freezed == pokemonDetails
            ? _value.pokemonDetails
            : pokemonDetails // ignore: cast_nullable_to_non_nullable
                  as PokemonDetailsModel?,
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
class _$PokemonDetailsStateImpl implements _PokemonDetailsState {
  const _$PokemonDetailsStateImpl({
    this.pokemonDetails,
    this.failure,
    this.isLoading = false,
  });

  factory _$PokemonDetailsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDetailsStateImplFromJson(json);

  @override
  final PokemonDetailsModel? pokemonDetails;
  @override
  final Failure? failure;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'PokemonDetailsState(pokemonDetails: $pokemonDetails, failure: $failure, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailsStateImpl &&
            (identical(other.pokemonDetails, pokemonDetails) ||
                other.pokemonDetails == pokemonDetails) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pokemonDetails, failure, isLoading);

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailsStateImplCopyWith<_$PokemonDetailsStateImpl> get copyWith =>
      __$$PokemonDetailsStateImplCopyWithImpl<_$PokemonDetailsStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDetailsStateImplToJson(
      this,
    );
  }
}

abstract class _PokemonDetailsState implements PokemonDetailsState {
  const factory _PokemonDetailsState({
    final PokemonDetailsModel? pokemonDetails,
    final Failure? failure,
    final bool isLoading,
  }) = _$PokemonDetailsStateImpl;

  factory _PokemonDetailsState.fromJson(Map<String, dynamic> json) =
      _$PokemonDetailsStateImpl.fromJson;

  @override
  PokemonDetailsModel? get pokemonDetails;
  @override
  Failure? get failure;
  @override
  bool get isLoading;

  /// Create a copy of PokemonDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailsStateImplCopyWith<_$PokemonDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
