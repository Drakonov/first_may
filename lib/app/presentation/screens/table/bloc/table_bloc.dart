import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bloc/bloc.dart';
import 'package:first_may/app/navigation/app_router.dart';
import 'package:first_may/core/bloc/base_bloc_state.dart';
import 'package:first_may/core/bloc/bloc_action.dart';
import 'package:first_may/core/utils/excel/myExcel.dart';
import 'package:first_may/data/gateways/remote/remote_repository.dart';
import 'package:first_may/domain/enums/current_state_window.dart';
import 'package:first_may/model/person.dart';
import 'package:first_may/model/sells.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_bloc.freezed.dart';

part 'table_event.dart';

part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc(
    this._appRouter,
  ) : super(TableState()) {
    on<_Init>(_init);
    on<_SelectPerson>(_selectPerson);
    on<_AddNew>(_addNew);
    on<_SwitchCurrentStateWindow>(_switchCurrentStateWindow);
    on<_StatementPressed>(_statementPressed);
    on<_OnEnterPressed>(_onEnterPressed);
    on<_OnLongPressRow>(_onLongPressRow);
    on<_EditRowDone>(_onEditRowDone);
    add(const TableEvent.init());
  }

  final AppRouter _appRouter;

  FutureOr<void> _init(
    _Init event,
    Emitter<TableState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    List<Sell> sells = [];
    Set<String> persons = {};
    List<Person> personsList = [];

    for (var item in state.persons) {
      persons.add(item.fullName);
    }

    personsList.addAll(await RemoteRepository.getPersons());
    sells.addAll(await RemoteRepository.getSells());

    emit(state.copyWith(sells: sells, persons: personsList, loading: false));
  }

  FutureOr<void> _switchCurrentStateWindow(_SwitchCurrentStateWindow event, Emitter<TableState> emit) {
    final win = appWindow;
    emit(state.copyWith(selectedPerson: null));
    switch (state.currentStateWindow) {
      case CurrentStateWindow.active:
        emit(state.copyWith(positionWindowOnActive: win.position));
        const initialSize = Size(10, 10);
        win.minSize = initialSize;
        win.size = initialSize;
        if (state.positionWindowOnMinimize == null) {
          win.position = Offset(win.position.dx > 1920 ? 2000 : 600, 40);
        } else {
          win.position = state.positionWindowOnMinimize!;
        }
        emit(state.copyWith(currentStateWindow: CurrentStateWindow.minimize));
        break;
      case CurrentStateWindow.minimize:
        emit(state.copyWith(positionWindowOnMinimize: win.position));
        const initialSize = Size(650, 500);
        win.minSize = initialSize;
        win.size = initialSize;
        if (state.positionWindowOnActive != null) {
          win.position = state.positionWindowOnActive!;
        }
        emit(state.copyWith(currentStateWindow: CurrentStateWindow.active));

        break;
    }
  }

  FutureOr<void> _selectPerson(_SelectPerson event, Emitter<TableState> emit) async {
    emit(state.copyWith(selectedPerson: event.person));
  }

  FutureOr<void> _addNew(_AddNew event, Emitter<TableState> emit) async {
    emit(state.copyWith(loading: true));
    await RemoteRepository.addSell(event.sell);
    List<Sell> sells = [];
    sells.addAll(await RemoteRepository.getSells());
    emit(state.copyWith(sells: sells, selectedPerson: null, loading: false));
    add(const TableEvent.switchCurrentStateWindow());
  }

  Future<FutureOr<void>> _statementPressed(_StatementPressed event, Emitter<TableState> emit) async {
    String path = "/xls/r.xlsx";
    ExcelHelper.createExcelFromSells(sells: state.sells, path: path);
    print('file create');
    emit(state.copyWith(action: ShowStatementDone()));
  }

  FutureOr<void> _onEnterPressed(_OnEnterPressed event, Emitter<TableState> emit) {
    add(const TableEvent.switchCurrentStateWindow());
  }

  FutureOr<void> _onLongPressRow(_OnLongPressRow event, Emitter<TableState> emit) {
    emit(state.copyWith(action: ShowEditingModal(event.index)));
  }

  Future<FutureOr<void>> _onEditRowDone(_EditRowDone event, Emitter<TableState> emit) async {
    emit(state.copyWith(loading: true));
    List<Sell> sells = [];
    try {
      await RemoteRepository.updateSell(event.sell);
      sells.addAll(await RemoteRepository.getSells());
    } catch (e) {}

    emit(state.copyWith(sells: sells, selectedPerson: null, loading: false));
  }
}
