part of 'table_bloc.dart';

@freezed
class TableEvent with _$TableEvent {
  const factory TableEvent.init() = _Init;

  const factory TableEvent.movePressed() = _MovePressed;

  const factory TableEvent.addNew(Sell sell) = _AddNew;

  const factory TableEvent.addNewPerson(Person person) = _AddNewPerson;

  const factory TableEvent.selectPerson(Person person) = _SelectPerson;

  const factory TableEvent.closePressed() = _ClosePressed;

  const factory TableEvent.statementPressed() = _StatementPressed;

  const factory TableEvent.declarationPressed() = _DeclarationPressed;

  const factory TableEvent.switchCurrentStateWindow() = _SwitchCurrentStateWindow;

  const factory TableEvent.onLongPressRow(int index) = _OnLongPressRow;

  const factory TableEvent.onEnterPressed() = _OnEnterPressed;

  const factory TableEvent.editRowDone(Sell sell, int index) = _EditRowDone;
}

class ShowStatementDone extends BlocAction {}

class ShowEditingModal extends BlocAction {
  final int index;

  ShowEditingModal(this.index);
}
