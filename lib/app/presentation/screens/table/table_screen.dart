import 'package:auto_route/auto_route.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:first_may/app/presentation/widgets/data_table_widget.dart';
import 'package:first_may/app/presentation/widgets/win_buttons.dart';
import 'package:first_may/core/utils/context_extensions.dart';
import 'package:first_may/domain/enums/current_state_window.dart';
import 'package:first_may/model/person.dart';
import 'package:first_may/model/sells.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_may/app/presentation/screens/table/bloc/table_bloc.dart';
import 'package:first_may/app/presentation/widgets/others/screen_wrapper.dart';
import 'package:first_may/core/ui/widgets/base_bloc_listener.dart';
import 'package:first_may/di/app_locator.dart';

TextEditingController _summController = TextEditingController();
FocusNode _focusNode = FocusNode();
FocusNode _focusNode2 = FocusNode();

@RoutePage()
class TableScreen extends StatefulWidget implements AutoRouteWrapper {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();

  @override
  Widget wrappedRoute(context) => BlocProvider(
        create: (context) => TableBloc(
          Locator.injection(),
        ),
        child: this,
      );
}

class _TableScreenState extends State<TableScreen> {
  @override
  Widget build(BuildContext context) => BaseBlocListener<TableBloc, TableState>(
        listener: (context, state, action) async {
          if (action is ShowStatementDone) {
            showStatementDoneDialog(context);
          }
          if (action is ShowEditingModal) {
            showEditModal(context, state, action.index);
          }
        },
        child: ScreenWrapper(
          child: SafeArea(
            child: Scaffold(
              body: WindowBorder(
                color: borderColor,
                width: 1,
                child: BlocBuilder<TableBloc, TableState>(
                  buildWhen: (previous, current) => previous.currentStateWindow != current.currentStateWindow,
                  builder: (context, state) {
                    switch (state.currentStateWindow) {
                      case CurrentStateWindow.active:
                        return Column(
                          children: [
                            buildWinButtons(context),
                            buildAppBar(context, state),
                            Expanded(
                              child: buildTable(),
                            ),
                            const SizedBox(height: 20),
                            //buildBottomButtons(context)
                          ],
                        );
                      case CurrentStateWindow.minimize:
                        return buildButtonSwitch(context);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildButtonSwitch(BuildContext context) {
    return Container(
      color: Colors.deepOrange.withOpacity(0.5),
      child: Row(
        children: [
          Expanded(child: MoveWindow()),
          Center(
            child: GestureDetector(
                onTap: () => context.sendEvent<TableBloc>(const TableEvent.switchCurrentStateWindow()),
                child: const Icon(Icons.cached)),
          ),
          Expanded(child: MoveWindow()),
        ],
      ),
    );
  }

  Widget buildWinButtons(BuildContext context) {
    return Row(
      children: [
        WindowsButtons(
          onTapMinimize: () => context.sendEvent<TableBloc>(const TableEvent.switchCurrentStateWindow()),
        ),
      ],
    );
  }

  Widget buildAppBar(BuildContext context, TableState state) {
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        if (state.loading == true) {
          return const SizedBox();
        }
        return Row(
          children: [
            //const SizedBox(width: 5),
            //buildAddNewPersonButton(context),
            const SizedBox(width: 35),
            buildDropDown(state, context),
            const SizedBox(width: 20),
            buildTextFieldSumm(),
            const SizedBox(width: 20),
            buildAddNewSaleButton(context),
            const SizedBox(width: 20),
          ],
        );
      },
    );
  }

  Widget buildAddNewSaleButton(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      buildWhen: (previous, current) => previous.selectedPerson != current.selectedPerson,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (state.selectedPerson != null && _summController.text.isNotEmpty) {
              context.sendEvent<TableBloc>(
                TableEvent.addNew(
                  Sell(
                    person: state.selectedPerson!,
                    sum: double.parse(_summController.text.replaceAll(',', '.').replaceAll('-', '')),
                    dateSell: DateTime.now(),
                  ),
                ),
              );
              _summController.clear();
            }
          },
          child: const Text('Ок'),
        );
      },
    );
  }

  Widget buildTextFieldSumm() {
    return Expanded(
      child: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          return TextField(
            focusNode: _focusNode,
            autofocus: false,
            controller: _summController,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*[.,]?\d{0,2})'))],
            decoration: const InputDecoration(hintText: 'Сумма'),
            onEditingComplete: () {
              context.sendEvent<TableBloc>(
                TableEvent.addNew(
                  Sell(
                    person: state.selectedPerson!,
                    sum: double.parse(_summController.text.replaceAll(',', '.').replaceAll('-', '')),
                    dateSell: DateTime.now(),
                  ),
                ),
              );
              _summController.clear();
            },
          );
        },
      ),
    );
  }

  Widget buildAddNewPersonButton(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return IconButton(
      onPressed: () async {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Новый'),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Введите ФИО'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      //if (controller.text.isNotEmpty) {
                      //  context.sendEvent<TableBloc>(
                      //    TableEvent.addNewPerson(
                      //      Person(
                      //        fullName: controller.text,
                      //      ),
                      //    ),
                      //  );
                      //  Navigator.pop(context, true);
                      //}
                    },
                    child: const Text("Добавить"),
                  )
                ],
              );
            });
      },
      icon: const Icon(Icons.add),
    );
  }

  Widget buildDropDown(TableState state, BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<TableBloc, TableState>(
        buildWhen: (previous, current) =>
            previous.persons != current.persons || previous.selectedPerson != current.selectedPerson,
        builder: (context, state) {
          return DropdownSearch<Person>(
            selectedItem: state.selectedPerson,
            popupProps: PopupProps.menu(
              emptyBuilder: (context, string) => Container(
                height: 70,
                alignment: Alignment.center,
                child: const Text('Пользователь не найден'),
              ),
              searchFieldProps: const TextFieldProps(
                autofocus: true,
              ),
              showSearchBox: true,
            ),
            items: state.persons,
            dropdownDecoratorProps: const DropDownDecoratorProps(
              baseStyle: TextStyle(fontSize: 16),
              dropdownSearchDecoration: InputDecoration(labelText: 'ФИО'),
            ),
            itemAsString: (Person u) => '${u.serviceNumber} ${u.fullName}',
            onChanged: (Person? person) {
              //FocusScope.of(context).requestFocus(FocusNode());

              if (person != null) {
                context.sendEvent<TableBloc>(TableEvent.selectPerson(person));
              }
              _focusNode.requestFocus();
              if (kDebugMode) {
                print(person?.fullName);
              }
            },
          );
        },
      ),
    );
  }

  Widget buildTable() {
    return BlocBuilder<TableBloc, TableState>(
      buildWhen: (previous, current) => previous.sells != current.sells || previous.loading != current.loading,
      builder: (context, state) {
        if (state.loading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.sells.isEmpty) {
          return const Center(
            child: Text('Записей ещё нету'),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DataTableWidget(
                    people: state.sells,
                    onPressedRow: (index) => context.sendEvent<TableBloc>(TableEvent.onLongPressRow(index)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //ElevatedButton(
          //  onPressed: () {},
          //  child: const Text('Заявление'),
          //),
          //const SizedBox(width: 20),
          //MWWM
          ElevatedButton(
            onPressed: () {
              context.sendEvent<TableBloc>(const TableEvent.statementPressed());
            },
            child: const Text('Ведомость'),
          ),
          //const SizedBox(width: 20),
          //ElevatedButton(
          //  onPressed: () {},
          //  child: const Text('Закрыть'),
          //),
        ],
      ),
    );
  }

  showStatementDoneDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('Файл сформирован'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ок'),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showEditModal(BuildContext contextExternal, TableState state, int index) {
    // set up the AlertDialog
    TextEditingController sumController = TextEditingController();
    sumController.text = state.sells[index].sum.toString();
    Person? personSelected;
    for (var item in state.persons) {
      if (item.fullName == state.sells[index].person.fullName) {
        personSelected = item;
        break;
      }
    }
    AlertDialog alert = AlertDialog(
      title: const Text('Изменение данных по продаже'),
      content: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DropdownSearch<Person>(
            selectedItem: personSelected,
            popupProps: const PopupProps.menu(
              searchFieldProps: TextFieldProps(
                autofocus: true,
              ),
              showSearchBox: true,
            ),
            items: state.persons,
            dropdownDecoratorProps: const DropDownDecoratorProps(
              baseStyle: TextStyle(fontSize: 16),
              dropdownSearchDecoration: InputDecoration(labelText: 'ФИО'),
            ),
            itemAsString: (Person u) => '${u.serviceNumber} ${u.fullName}',
            onChanged: (Person? person) {
              //FocusScope.of(context).requestFocus(FocusNode());

              if (person != null) {
                personSelected = person;
              }
              _focusNode2.requestFocus();
              if (kDebugMode) {
                print(person?.fullName);
              }
            },
          ),
          TextField(
            autofocus: false,
            focusNode: _focusNode2,
            controller: sumController,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*[.,]?\d{0,2})'))],
            decoration: const InputDecoration(hintText: 'Сумма'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (personSelected != null) {
              contextExternal.sendEvent<TableBloc>(
                TableEvent.editRowDone(
                  Sell(
                    id: state.sells[index].id,
                    idSell: state.sells[index].idSell,
                    person: personSelected!,
                    sum: double.parse(sumController.text.replaceAll('-', '')),
                    dateSell: state.sells[index].dateSell,
                  ),
                  index,
                  personSelected!,
                ),
              );
            }
          },
          child: const Text('Внести изменения'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Отмена'),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
