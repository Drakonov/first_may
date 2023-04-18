part of 'table_bloc.dart';

@freezed
class TableState extends BaseBlocState with _$TableState {
  factory TableState({
    BlocAction? action,
    @Default(MainAxisAlignment.start) MainAxisAlignment axisCurrent,
    @Default(false) bool leftButtonActive,
    @Default(true) bool rightButtonActive,
    @Default(Duration(seconds: 1)) Duration duration,
    @Default(null) Person? selectedPerson,
    @Default([]) List<Sell> sells,
    @Default([]) List<Person> persons,
    @Default(CurrentStateWindow.active) CurrentStateWindow currentStateWindow,
    @Default(null) Offset? positionWindowOnMinimize,
    @Default(null) Offset? positionWindowOnActive,
  }) = _StartState;
}

class ShowNeedUpdateMessage extends BlocAction {}

