import 'package:data_table_2/data_table_2.dart';
import 'package:first_may/model/sells.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key, required this.people, this.onPressedRow});

  final List<Sell> people;
  final Function(int)? onPressedRow;

  @override
  Widget build(BuildContext context) {
    List<Sell> peopleReversed = List.from(people.reversed);

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
        ),
        child: DataTable2(
          columnSpacing: 8,
          horizontalMargin: 8,
          minWidth: 500,
          smRatio: 0.75,
          lmRatio: 1.5,
          columns: const [
            DataColumn2(
              size: ColumnSize.L,
              label: Text('ФИО'),
            ),
            DataColumn2(
              size: ColumnSize.S,
              label: Text('Сумма'),
              numeric: true,
            ),
            DataColumn2(
              size: ColumnSize.S,
              label: Text('Дата'),
              numeric: true,
            ),
          ],
          rows: buildListRows(peopleReversed),
        ),
      ),
    );
  }

  List<DataRow> buildListRows(List<Sell> peopleReversed) {
    List<DataRow> listRows = [];
    Map<String, DataRow> addedRows = {};
    listRows = List<DataRow>.generate(
      peopleReversed.length,
      (index) {
        return buildDataRow(peopleReversed, index);
      },
    );
    print(listRows.length);

    //Создаем мапу, заполняем её ключами с пулом дат
    Map<String, List<Sell>> map = {};
    for (var item in peopleReversed) {
      map[Jiffy(item.dateSell).yMd] = [];
    }
    //Заполняем мапу списками продаж по дням
    for (var item in peopleReversed) {
      List<Sell> items = map[Jiffy(item.dateSell).yMd]!;
      items.add(item);
      map.update(Jiffy(item.dateSell).yMd, (value) => items);
    }
    print(map);
    //По каждому ключу(дате), получаем сумму элементов списка за день
    for (var key in map.keys) {
      double sum = 0;
      List<Sell> list = map[key]!;
      for (var i in list) {
        sum = sum + i.sum;
      }
      //Добавляем в новую мапу вида (Дата, Строка)
      addedRows[key] = DataRow(
        color: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.6)),
        cells: [
          const DataCell(Text('Сумма за день')),
          DataCell(Text('~${sum.toStringAsFixed(2)} P')),
          DataCell(Text(key)),
        ],
      );
    }
    Sell? sell;
    int count = 0;
    for (var item in peopleReversed.reversed) {
      if (sell != null && Jiffy(item.dateSell).yMd != Jiffy(sell.dateSell).yMd) {
        sell = null;
      }
      count++;
      if (addedRows[Jiffy(item.dateSell).yMd] != null && sell == null) {
        sell = item;
        listRows.insert(peopleReversed.length - count + 1, addedRows[Jiffy(item.dateSell).yMd]!);
      }
    }
    print(listRows.length);

    return listRows;
  }

  DataRow buildDataRow(List<Sell> peopleReversed, int index) {
    return DataRow(
      onLongPress: () {
        onPressedRow?.call(peopleReversed.length - index - 1);
      },
      color: index % 2 == 1
          ? MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.1))
          : MaterialStateProperty.all<Color>(Colors.yellow.withOpacity(0.4)),
      cells: [
        DataCell(Text('${peopleReversed.length - index}. ${peopleReversed[index].person.fullName}')),
        DataCell(Text('${peopleReversed[index].sum} P')),
        DataCell(Text(Jiffy(peopleReversed[index].dateSell).format('HH:mm dd.MM'))),
      ],
    );
  }
}
