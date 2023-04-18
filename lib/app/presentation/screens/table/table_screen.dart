import 'package:auto_route/auto_route.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:first_may/app/presentation/widgets/data_table_widget.dart';
import 'package:first_may/app/presentation/widgets/win_buttons.dart';
import 'package:first_may/core/utils/context_extensions.dart';
import 'package:first_may/domain/enums/current_state_window.dart';
import 'package:first_may/model/person.dart';
import 'package:first_may/model/sells.dart';
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
                            buildBottomButtons(context)
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
                    fullname: state.selectedPerson!.fullname,
                    summ: double.parse(_summController.text),
                    date: DateTime.now(),
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
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d{0,2})'))],
            decoration: const InputDecoration(hintText: 'Сумма'),
            onEditingComplete: () {
              context.sendEvent<TableBloc>(
                TableEvent.addNew(
                  Sell(
                    fullname: state.selectedPerson!.fullname,
                    summ: double.parse(_summController.text),
                    date: DateTime.now(),
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
                      if (controller.text.isNotEmpty) {
                        context.sendEvent<TableBloc>(
                          TableEvent.addNewPerson(
                            Person(
                              fullname: controller.text,
                            ),
                          ),
                        );
                        Navigator.pop(context, true);
                      }
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
      child: Focus(
        autofocus: true,
        child: BlocBuilder<TableBloc, TableState>(
          buildWhen: (previous, current) =>
              previous.persons != current.persons || previous.selectedPerson != current.selectedPerson,
          builder: (context, state) {
            return DropdownSearch<Person>(
              selectedItem: state.selectedPerson,
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
              itemAsString: (Person u) => u.fullname,
              onChanged: (Person? person) {
                //FocusScope.of(context).requestFocus(FocusNode());

                if (person != null) {
                  context.sendEvent<TableBloc>(TableEvent.selectPerson(person));
                }
                _focusNode.requestFocus();
                print(person?.fullname);
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildTable() {
    return BlocBuilder<TableBloc, TableState>(
      buildWhen: (previous, current) => previous.sells != current.sells,
      builder: (context, state) {
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
          child: Text('Ок'),
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
    TextEditingController summController = TextEditingController();
    summController.text = state.sells[index].summ.toString();
    Person? _person;
    for (var item in state.persons) {
      if (item.fullname == state.sells[index].fullname) {
        _person = item;
        break;
      }
    }
    AlertDialog alert = AlertDialog(
      title: const Text('Изменение данных по продаже'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownSearch<Person>(
            selectedItem: _person,
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
            itemAsString: (Person u) => u.fullname,
            onChanged: (Person? person) {
              //FocusScope.of(context).requestFocus(FocusNode());

              if (person != null) {
                _person = person;
              }
              _focusNode2.requestFocus();
              print(person?.fullname);
            },
          ),
          TextField(
            autofocus: false,
            focusNode: _focusNode2,
            controller: summController,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d{0,2})'))],
            decoration: const InputDecoration(hintText: 'Сумма'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            contextExternal.sendEvent<TableBloc>(
              TableEvent.editRowDone(
                Sell(
                  fullname: _person!.fullname,
                  summ: double.parse(summController.text),
                  date: state.sells[index].date,
                ),
                index,
              ),
            );
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
