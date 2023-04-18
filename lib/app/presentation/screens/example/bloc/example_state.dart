part of 'example_bloc.dart';

@freezed
class ExampleState extends BaseBlocState with _$ExampleState {
  factory ExampleState({
    BlocAction? action,
  }) = _StartState;
}

class ShowNeedUpdateMessage extends BlocAction {}

class RegisterLocalization extends BlocAction {}
