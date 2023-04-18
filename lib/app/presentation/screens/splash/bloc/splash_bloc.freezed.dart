// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() pressedUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? pressedUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? pressedUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_PressedUpdate value) pressedUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_PressedUpdate value)? pressedUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_PressedUpdate value)? pressedUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
          SplashEvent value, $Res Function(SplashEvent) then) =
      _$SplashEventCopyWithImpl<$Res, SplashEvent>;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res, $Val extends SplashEvent>
    implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

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
    extends _$SplashEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'SplashEvent.init()';
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
    required TResult Function() pressedUpdate,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? pressedUpdate,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? pressedUpdate,
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
    required TResult Function(_PressedUpdate value) pressedUpdate,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_PressedUpdate value)? pressedUpdate,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_PressedUpdate value)? pressedUpdate,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements SplashEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_PressedUpdateCopyWith<$Res> {
  factory _$$_PressedUpdateCopyWith(
          _$_PressedUpdate value, $Res Function(_$_PressedUpdate) then) =
      __$$_PressedUpdateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PressedUpdateCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$_PressedUpdate>
    implements _$$_PressedUpdateCopyWith<$Res> {
  __$$_PressedUpdateCopyWithImpl(
      _$_PressedUpdate _value, $Res Function(_$_PressedUpdate) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PressedUpdate implements _PressedUpdate {
  const _$_PressedUpdate();

  @override
  String toString() {
    return 'SplashEvent.pressedUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PressedUpdate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() pressedUpdate,
  }) {
    return pressedUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? pressedUpdate,
  }) {
    return pressedUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? pressedUpdate,
    required TResult orElse(),
  }) {
    if (pressedUpdate != null) {
      return pressedUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_PressedUpdate value) pressedUpdate,
  }) {
    return pressedUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_PressedUpdate value)? pressedUpdate,
  }) {
    return pressedUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_PressedUpdate value)? pressedUpdate,
    required TResult orElse(),
  }) {
    if (pressedUpdate != null) {
      return pressedUpdate(this);
    }
    return orElse();
  }
}

abstract class _PressedUpdate implements SplashEvent {
  const factory _PressedUpdate() = _$_PressedUpdate;
}

/// @nodoc
mixin _$SplashState {
  BlocAction? get action => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ErrorLaunch get errorLaunch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashStateCopyWith<SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
  @useResult
  $Res call({BlocAction? action, bool isLoading, ErrorLaunch errorLaunch});
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? isLoading = null,
    Object? errorLaunch = null,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorLaunch: null == errorLaunch
          ? _value.errorLaunch
          : errorLaunch // ignore: cast_nullable_to_non_nullable
              as ErrorLaunch,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartStateCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory _$$_StartStateCopyWith(
          _$_StartState value, $Res Function(_$_StartState) then) =
      __$$_StartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BlocAction? action, bool isLoading, ErrorLaunch errorLaunch});
}

/// @nodoc
class __$$_StartStateCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_StartState>
    implements _$$_StartStateCopyWith<$Res> {
  __$$_StartStateCopyWithImpl(
      _$_StartState _value, $Res Function(_$_StartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? isLoading = null,
    Object? errorLaunch = null,
  }) {
    return _then(_$_StartState(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorLaunch: null == errorLaunch
          ? _value.errorLaunch
          : errorLaunch // ignore: cast_nullable_to_non_nullable
              as ErrorLaunch,
    ));
  }
}

/// @nodoc

class _$_StartState implements _StartState {
  _$_StartState(
      {this.action,
      this.isLoading = true,
      this.errorLaunch = ErrorLaunch.none});

  @override
  final BlocAction? action;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ErrorLaunch errorLaunch;

  @override
  String toString() {
    return 'SplashState(action: $action, isLoading: $isLoading, errorLaunch: $errorLaunch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartState &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorLaunch, errorLaunch) ||
                other.errorLaunch == errorLaunch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action, isLoading, errorLaunch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartStateCopyWith<_$_StartState> get copyWith =>
      __$$_StartStateCopyWithImpl<_$_StartState>(this, _$identity);
}

abstract class _StartState implements SplashState {
  factory _StartState(
      {final BlocAction? action,
      final bool isLoading,
      final ErrorLaunch errorLaunch}) = _$_StartState;

  @override
  BlocAction? get action;
  @override
  bool get isLoading;
  @override
  ErrorLaunch get errorLaunch;
  @override
  @JsonKey(ignore: true)
  _$$_StartStateCopyWith<_$_StartState> get copyWith =>
      throw _privateConstructorUsedError;
}
