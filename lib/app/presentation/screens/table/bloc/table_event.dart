part of 'table_bloc.dart';

@freezed
class TableEvent with _$TableEvent {
  const factory TableEvent.init() = _Init;

  const factory TableEvent.movePressed() = _MovePressed;
  const factory TableEvent.addNew(Sell sell) = _AddNew;
  const factory TableEvent.addNewPerson(String fullname) = _AddNewPerson;
  const factory TableEvent.selectPerson(String fullname) = _SelectPerson;
  const factory TableEvent.closePressed() = _ClosePressed;
  const factory TableEvent.statementPressed() = _StatementPressed;
  const factory TableEvent.declarationPressed() = _DeclarationPressed;
  const factory TableEvent.switchCurrentStateWindow() = _SwitchCurrentStateWindow;
}
