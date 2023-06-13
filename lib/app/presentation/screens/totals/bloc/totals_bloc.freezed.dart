// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'totals_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TotalsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalsEventCopyWith<$Res> {
  factory $TotalsEventCopyWith(
          TotalsEvent value, $Res Function(TotalsEvent) then) =
      _$TotalsEventCopyWithImpl<$Res, TotalsEvent>;
}

/// @nodoc
class _$TotalsEventCopyWithImpl<$Res, $Val extends TotalsEvent>
    implements $TotalsEventCopyWith<$Res> {
  _$TotalsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$TotalsEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'TotalsEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements TotalsEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
mixin _$TotalsState {
  BlocAction? get action => throw _privateConstructorUsedError;
  Map<String, List<Sell>> get sellsByDays => throw _privateConstructorUsedError;
  Map<String, Map<int, List<Sell>>> get sellsByDaysAndWorkshops =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TotalsStateCopyWith<TotalsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TotalsStateCopyWith<$Res> {
  factory $TotalsStateCopyWith(
          TotalsState value, $Res Function(TotalsState) then) =
      _$TotalsStateCopyWithImpl<$Res, TotalsState>;
  @useResult
  $Res call(
      {BlocAction? action,
      Map<String, List<Sell>> sellsByDays,
      Map<String, Map<int, List<Sell>>> sellsByDaysAndWorkshops});
}

/// @nodoc
class _$TotalsStateCopyWithImpl<$Res, $Val extends TotalsState>
    implements $TotalsStateCopyWith<$Res> {
  _$TotalsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? sellsByDays = null,
    Object? sellsByDaysAndWorkshops = null,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      sellsByDays: null == sellsByDays
          ? _value.sellsByDays
          : sellsByDays // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Sell>>,
      sellsByDaysAndWorkshops: null == sellsByDaysAndWorkshops
          ? _value.sellsByDaysAndWorkshops
          : sellsByDaysAndWorkshops // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<int, List<Sell>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartStateCopyWith<$Res>
    implements $TotalsStateCopyWith<$Res> {
  factory _$$_StartStateCopyWith(
          _$_StartState value, $Res Function(_$_StartState) then) =
      __$$_StartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocAction? action,
      Map<String, List<Sell>> sellsByDays,
      Map<String, Map<int, List<Sell>>> sellsByDaysAndWorkshops});
}

/// @nodoc
class __$$_StartStateCopyWithImpl<$Res>
    extends _$TotalsStateCopyWithImpl<$Res, _$_StartState>
    implements _$$_StartStateCopyWith<$Res> {
  __$$_StartStateCopyWithImpl(
      _$_StartState _value, $Res Function(_$_StartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? sellsByDays = null,
    Object? sellsByDaysAndWorkshops = null,
  }) {
    return _then(_$_StartState(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      sellsByDays: null == sellsByDays
          ? _value._sellsByDays
          : sellsByDays // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Sell>>,
      sellsByDaysAndWorkshops: null == sellsByDaysAndWorkshops
          ? _value._sellsByDaysAndWorkshops
          : sellsByDaysAndWorkshops // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<int, List<Sell>>>,
    ));
  }
}

/// @nodoc

class _$_StartState implements _StartState {
  _$_StartState(
      {this.action,
      final Map<String, List<Sell>> sellsByDays = const {},
      final Map<String, Map<int, List<Sell>>> sellsByDaysAndWorkshops =
          const {}})
      : _sellsByDays = sellsByDays,
        _sellsByDaysAndWorkshops = sellsByDaysAndWorkshops;

  @override
  final BlocAction? action;
  final Map<String, List<Sell>> _sellsByDays;
  @override
  @JsonKey()
  Map<String, List<Sell>> get sellsByDays {
    if (_sellsByDays is EqualUnmodifiableMapView) return _sellsByDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sellsByDays);
  }

  final Map<String, Map<int, List<Sell>>> _sellsByDaysAndWorkshops;
  @override
  @JsonKey()
  Map<String, Map<int, List<Sell>>> get sellsByDaysAndWorkshops {
    if (_sellsByDaysAndWorkshops is EqualUnmodifiableMapView)
      return _sellsByDaysAndWorkshops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sellsByDaysAndWorkshops);
  }

  @override
  String toString() {
    return 'TotalsState(action: $action, sellsByDays: $sellsByDays, sellsByDaysAndWorkshops: $sellsByDaysAndWorkshops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartState &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality()
                .equals(other._sellsByDays, _sellsByDays) &&
            const DeepCollectionEquality().equals(
                other._sellsByDaysAndWorkshops, _sellsByDaysAndWorkshops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      action,
      const DeepCollectionEquality().hash(_sellsByDays),
      const DeepCollectionEquality().hash(_sellsByDaysAndWorkshops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartStateCopyWith<_$_StartState> get copyWith =>
      __$$_StartStateCopyWithImpl<_$_StartState>(this, _$identity);
}

abstract class _StartState implements TotalsState {
  factory _StartState(
          {final BlocAction? action,
          final Map<String, List<Sell>> sellsByDays,
          final Map<String, Map<int, List<Sell>>> sellsByDaysAndWorkshops}) =
      _$_StartState;

  @override
  BlocAction? get action;
  @override
  Map<String, List<Sell>> get sellsByDays;
  @override
  Map<String, Map<int, List<Sell>>> get sellsByDaysAndWorkshops;
  @override
  @JsonKey(ignore: true)
  _$$_StartStateCopyWith<_$_StartState> get copyWith =>
      throw _privateConstructorUsedError;
}
