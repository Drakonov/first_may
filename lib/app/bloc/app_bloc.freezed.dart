// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitCopyWith<$Res> {
  factory _$$InitCopyWith(_$Init value, $Res Function(_$Init) then) =
      __$$InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res, _$Init>
    implements _$$InitCopyWith<$Res> {
  __$$InitCopyWithImpl(_$Init _value, $Res Function(_$Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Init implements Init {
  const _$Init();

  @override
  String toString() {
    return 'AppEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
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
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements AppEvent {
  const factory Init() = _$Init;
}

/// @nodoc
abstract class _$$AppLifecycleStateChangedCopyWith<$Res> {
  factory _$$AppLifecycleStateChangedCopyWith(_$AppLifecycleStateChanged value,
          $Res Function(_$AppLifecycleStateChanged) then) =
      __$$AppLifecycleStateChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({AppLifecycleState state});
}

/// @nodoc
class __$$AppLifecycleStateChangedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppLifecycleStateChanged>
    implements _$$AppLifecycleStateChangedCopyWith<$Res> {
  __$$AppLifecycleStateChangedCopyWithImpl(_$AppLifecycleStateChanged _value,
      $Res Function(_$AppLifecycleStateChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$AppLifecycleStateChanged(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AppLifecycleState,
    ));
  }
}

/// @nodoc

class _$AppLifecycleStateChanged implements AppLifecycleStateChanged {
  const _$AppLifecycleStateChanged(this.state);

  @override
  final AppLifecycleState state;

  @override
  String toString() {
    return 'AppEvent.appLifecycleStateChanged(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLifecycleStateChanged &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLifecycleStateChangedCopyWith<_$AppLifecycleStateChanged>
      get copyWith =>
          __$$AppLifecycleStateChangedCopyWithImpl<_$AppLifecycleStateChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return appLifecycleStateChanged(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return appLifecycleStateChanged?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) {
    if (appLifecycleStateChanged != null) {
      return appLifecycleStateChanged(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return appLifecycleStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return appLifecycleStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (appLifecycleStateChanged != null) {
      return appLifecycleStateChanged(this);
    }
    return orElse();
  }
}

abstract class AppLifecycleStateChanged implements AppEvent {
  const factory AppLifecycleStateChanged(final AppLifecycleState state) =
      _$AppLifecycleStateChanged;

  AppLifecycleState get state;
  @JsonKey(ignore: true)
  _$$AppLifecycleStateChangedCopyWith<_$AppLifecycleStateChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LearningModeChangedCopyWith<$Res> {
  factory _$$LearningModeChangedCopyWith(_$LearningModeChanged value,
          $Res Function(_$LearningModeChanged) then) =
      __$$LearningModeChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool learningMode});
}

/// @nodoc
class __$$LearningModeChangedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LearningModeChanged>
    implements _$$LearningModeChangedCopyWith<$Res> {
  __$$LearningModeChangedCopyWithImpl(
      _$LearningModeChanged _value, $Res Function(_$LearningModeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? learningMode = null,
  }) {
    return _then(_$LearningModeChanged(
      null == learningMode
          ? _value.learningMode
          : learningMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LearningModeChanged implements LearningModeChanged {
  const _$LearningModeChanged(this.learningMode);

  @override
  final bool learningMode;

  @override
  String toString() {
    return 'AppEvent.learningModeChanged(learningMode: $learningMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningModeChanged &&
            (identical(other.learningMode, learningMode) ||
                other.learningMode == learningMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, learningMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningModeChangedCopyWith<_$LearningModeChanged> get copyWith =>
      __$$LearningModeChangedCopyWithImpl<_$LearningModeChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return learningModeChanged(learningMode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return learningModeChanged?.call(learningMode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) {
    if (learningModeChanged != null) {
      return learningModeChanged(learningMode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return learningModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return learningModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (learningModeChanged != null) {
      return learningModeChanged(this);
    }
    return orElse();
  }
}

abstract class LearningModeChanged implements AppEvent {
  const factory LearningModeChanged(final bool learningMode) =
      _$LearningModeChanged;

  bool get learningMode;
  @JsonKey(ignore: true)
  _$$LearningModeChangedCopyWith<_$LearningModeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeLearningModePressedCopyWith<$Res> {
  factory _$$ChangeLearningModePressedCopyWith(
          _$ChangeLearningModePressed value,
          $Res Function(_$ChangeLearningModePressed) then) =
      __$$ChangeLearningModePressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeLearningModePressedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ChangeLearningModePressed>
    implements _$$ChangeLearningModePressedCopyWith<$Res> {
  __$$ChangeLearningModePressedCopyWithImpl(_$ChangeLearningModePressed _value,
      $Res Function(_$ChangeLearningModePressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeLearningModePressed implements ChangeLearningModePressed {
  const _$ChangeLearningModePressed();

  @override
  String toString() {
    return 'AppEvent.changeLearningModePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLearningModePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return changeLearningModePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return changeLearningModePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) {
    if (changeLearningModePressed != null) {
      return changeLearningModePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return changeLearningModePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return changeLearningModePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (changeLearningModePressed != null) {
      return changeLearningModePressed(this);
    }
    return orElse();
  }
}

abstract class ChangeLearningModePressed implements AppEvent {
  const factory ChangeLearningModePressed() = _$ChangeLearningModePressed;
}

/// @nodoc
abstract class _$$MenuPressedCopyWith<$Res> {
  factory _$$MenuPressedCopyWith(
          _$MenuPressed value, $Res Function(_$MenuPressed) then) =
      __$$MenuPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MenuPressedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$MenuPressed>
    implements _$$MenuPressedCopyWith<$Res> {
  __$$MenuPressedCopyWithImpl(
      _$MenuPressed _value, $Res Function(_$MenuPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MenuPressed implements MenuPressed {
  const _$MenuPressed();

  @override
  String toString() {
    return 'AppEvent.menuPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MenuPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return menuPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return menuPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) {
    if (menuPressed != null) {
      return menuPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return menuPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return menuPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (menuPressed != null) {
      return menuPressed(this);
    }
    return orElse();
  }
}

abstract class MenuPressed implements AppEvent {
  const factory MenuPressed() = _$MenuPressed;
}

/// @nodoc
abstract class _$$MemoryUsagePressedCopyWith<$Res> {
  factory _$$MemoryUsagePressedCopyWith(_$MemoryUsagePressed value,
          $Res Function(_$MemoryUsagePressed) then) =
      __$$MemoryUsagePressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemoryUsagePressedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$MemoryUsagePressed>
    implements _$$MemoryUsagePressedCopyWith<$Res> {
  __$$MemoryUsagePressedCopyWithImpl(
      _$MemoryUsagePressed _value, $Res Function(_$MemoryUsagePressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MemoryUsagePressed implements MemoryUsagePressed {
  const _$MemoryUsagePressed();

  @override
  String toString() {
    return 'AppEvent.memoryUsagePressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemoryUsagePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return memoryUsagePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return memoryUsagePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) {
    if (memoryUsagePressed != null) {
      return memoryUsagePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return memoryUsagePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return memoryUsagePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (memoryUsagePressed != null) {
      return memoryUsagePressed(this);
    }
    return orElse();
  }
}

abstract class MemoryUsagePressed implements AppEvent {
  const factory MemoryUsagePressed() = _$MemoryUsagePressed;
}

/// @nodoc
abstract class _$$LogsPressedCopyWith<$Res> {
  factory _$$LogsPressedCopyWith(
          _$LogsPressed value, $Res Function(_$LogsPressed) then) =
      __$$LogsPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogsPressedCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LogsPressed>
    implements _$$LogsPressedCopyWith<$Res> {
  __$$LogsPressedCopyWithImpl(
      _$LogsPressed _value, $Res Function(_$LogsPressed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogsPressed implements LogsPressed {
  const _$LogsPressed();

  @override
  String toString() {
    return 'AppEvent.logsPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogsPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return logsPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return logsPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) {
    if (logsPressed != null) {
      return logsPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return logsPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return logsPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (logsPressed != null) {
      return logsPressed(this);
    }
    return orElse();
  }
}

abstract class LogsPressed implements AppEvent {
  const factory LogsPressed() = _$LogsPressed;
}

/// @nodoc
abstract class _$$SwitchColorSchemeCopyWith<$Res> {
  factory _$$SwitchColorSchemeCopyWith(
          _$SwitchColorScheme value, $Res Function(_$SwitchColorScheme) then) =
      __$$SwitchColorSchemeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchColorSchemeCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$SwitchColorScheme>
    implements _$$SwitchColorSchemeCopyWith<$Res> {
  __$$SwitchColorSchemeCopyWithImpl(
      _$SwitchColorScheme _value, $Res Function(_$SwitchColorScheme) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchColorScheme implements SwitchColorScheme {
  const _$SwitchColorScheme();

  @override
  String toString() {
    return 'AppEvent.switchColorScheme()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchColorScheme);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
    required TResult Function(bool learningMode) learningModeChanged,
    required TResult Function() changeLearningModePressed,
    required TResult Function() menuPressed,
    required TResult Function() memoryUsagePressed,
    required TResult Function() logsPressed,
    required TResult Function() switchColorScheme,
  }) {
    return switchColorScheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult? Function(bool learningMode)? learningModeChanged,
    TResult? Function()? changeLearningModePressed,
    TResult? Function()? menuPressed,
    TResult? Function()? memoryUsagePressed,
    TResult? Function()? logsPressed,
    TResult? Function()? switchColorScheme,
  }) {
    return switchColorScheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    TResult Function(bool learningMode)? learningModeChanged,
    TResult Function()? changeLearningModePressed,
    TResult Function()? menuPressed,
    TResult Function()? memoryUsagePressed,
    TResult Function()? logsPressed,
    TResult Function()? switchColorScheme,
    required TResult orElse(),
  }) {
    if (switchColorScheme != null) {
      return switchColorScheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value)
        appLifecycleStateChanged,
    required TResult Function(LearningModeChanged value) learningModeChanged,
    required TResult Function(ChangeLearningModePressed value)
        changeLearningModePressed,
    required TResult Function(MenuPressed value) menuPressed,
    required TResult Function(MemoryUsagePressed value) memoryUsagePressed,
    required TResult Function(LogsPressed value) logsPressed,
    required TResult Function(SwitchColorScheme value) switchColorScheme,
  }) {
    return switchColorScheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult? Function(LearningModeChanged value)? learningModeChanged,
    TResult? Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult? Function(MenuPressed value)? menuPressed,
    TResult? Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult? Function(LogsPressed value)? logsPressed,
    TResult? Function(SwitchColorScheme value)? switchColorScheme,
  }) {
    return switchColorScheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    TResult Function(LearningModeChanged value)? learningModeChanged,
    TResult Function(ChangeLearningModePressed value)?
        changeLearningModePressed,
    TResult Function(MenuPressed value)? menuPressed,
    TResult Function(MemoryUsagePressed value)? memoryUsagePressed,
    TResult Function(LogsPressed value)? logsPressed,
    TResult Function(SwitchColorScheme value)? switchColorScheme,
    required TResult orElse(),
  }) {
    if (switchColorScheme != null) {
      return switchColorScheme(this);
    }
    return orElse();
  }
}

abstract class SwitchColorScheme implements AppEvent {
  const factory SwitchColorScheme() = _$SwitchColorScheme;
}

/// @nodoc
mixin _$AppState {
  BlocAction? get action => throw _privateConstructorUsedError;
  Locale? get locale => throw _privateConstructorUsedError;
  bool get learningMode => throw _privateConstructorUsedError;
  ColorSchemeMode get colorSchemeMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {BlocAction? action,
      Locale? locale,
      bool learningMode,
      ColorSchemeMode colorSchemeMode});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? locale = freezed,
    Object? learningMode = null,
    Object? colorSchemeMode = null,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      learningMode: null == learningMode
          ? _value.learningMode
          : learningMode // ignore: cast_nullable_to_non_nullable
              as bool,
      colorSchemeMode: null == colorSchemeMode
          ? _value.colorSchemeMode
          : colorSchemeMode // ignore: cast_nullable_to_non_nullable
              as ColorSchemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocAction? action,
      Locale? locale,
      bool learningMode,
      ColorSchemeMode colorSchemeMode});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? locale = freezed,
    Object? learningMode = null,
    Object? colorSchemeMode = null,
  }) {
    return _then(_$_AppState(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      learningMode: null == learningMode
          ? _value.learningMode
          : learningMode // ignore: cast_nullable_to_non_nullable
              as bool,
      colorSchemeMode: null == colorSchemeMode
          ? _value.colorSchemeMode
          : colorSchemeMode // ignore: cast_nullable_to_non_nullable
              as ColorSchemeMode,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  _$_AppState(
      {this.action,
      this.locale,
      this.learningMode = false,
      this.colorSchemeMode = ColorSchemeMode.auto});

  @override
  final BlocAction? action;
  @override
  final Locale? locale;
  @override
  @JsonKey()
  final bool learningMode;
  @override
  @JsonKey()
  final ColorSchemeMode colorSchemeMode;

  @override
  String toString() {
    return 'AppState(action: $action, locale: $locale, learningMode: $learningMode, colorSchemeMode: $colorSchemeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.learningMode, learningMode) ||
                other.learningMode == learningMode) &&
            (identical(other.colorSchemeMode, colorSchemeMode) ||
                other.colorSchemeMode == colorSchemeMode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, action, locale, learningMode, colorSchemeMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  factory _AppState(
      {final BlocAction? action,
      final Locale? locale,
      final bool learningMode,
      final ColorSchemeMode colorSchemeMode}) = _$_AppState;

  @override
  BlocAction? get action;
  @override
  Locale? get locale;
  @override
  bool get learningMode;
  @override
  ColorSchemeMode get colorSchemeMode;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
