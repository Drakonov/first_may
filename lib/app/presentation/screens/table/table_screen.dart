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

@RoutePage()
class TableScreen extends StatelessWidget implements AutoRouteWrapper {
  const TableScreen({super.key});

  @override
  Widget wrappedRoute(context) => BlocProvider(
        create: (context) => TableBloc(
          Locator.injection(),
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) => BaseBlocListener<TableBloc, TableState>(
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
                        return RawKeyboardListener(
                          focusNode: FocusNode(),
                          autofocus: true,
                          onKey: (event) {
                            if (event.runtimeType == RawKeyDownEvent) {
                              if (event.physicalKey == PhysicalKeyboardKey.enter) {
                                context.sendEvent<TableBloc>(const TableEvent.switchCurrentStateWindow());
                              }
                            }
                          },
                          child: Column(
                            children: [
                              buildWinButtons(context),
                              buildAppBar(context, state),
                              Expanded(
                                child: buildTable(),
                              ),
                              buildButtomButtons(context)
                            ],
                          ),
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
        const SizedBox(width: 20),
        buildDropDown(state, context),
        const SizedBox(width: 20),
        buildAddNewPersonButton(context),
        const SizedBox(width: 20),
        buildTextFieldSumm(),
        const SizedBox(width: 20),
        buildAddNewSaleButton(state, context),
        const SizedBox(width: 20),
      ],
    );
  }

  ElevatedButton buildAddNewSaleButton(TableState state, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (state.selectedPerson != null && _summController.text.isNotEmpty) {
          context.sendEvent<TableBloc>(
            TableEvent.addNew(
              Sell(
                fullname: state.selectedPerson!,
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
  }

  Widget buildTextFieldSumm() {
    return Expanded(
      child: TextField(
        controller: _summController,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d{0,2})'))],
        decoration: const InputDecoration(hintText: 'Сумма'),
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
                        context.sendEvent<TableBloc>(TableEvent.addNewPerson(controller.text));
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
      child: DropdownSearch<Person>(
        popupProps: const PopupProps.menu(
          showSearchBox: true,
        ),
        items: state.persons,
        dropdownDecoratorProps: const DropDownDecoratorProps(
          baseStyle: TextStyle(fontSize: 16),
          dropdownSearchDecoration: InputDecoration(labelText: "ФИО"),
        ),
        itemAsString: (Person u) => u.fullname,
        onChanged: (Person? data) {
          if (data != null) {
            context.sendEvent<TableBloc>(TableEvent.selectPerson(data.fullname));
          }
          print(data?.fullname);
        },
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildButtomButtons(BuildContext context) {
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

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Файл сформирован'),
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
}
