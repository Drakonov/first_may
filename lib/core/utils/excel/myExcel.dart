import 'dart:io';

import 'package:excel/excel.dart';
import 'package:first_may/model/sells.dart';
import 'package:path/path.dart';

class ExcelHelper {
  static void createExcelFromSells({required List<Sell> sells, String? path}) {
    var excel = Excel.createExcel();

    var colIterableSheet = excel['Sheet1'];

    int colIndex = 0;
    int rowIndex = 0;
    var rows = ['Имя', 'Сумма', 'Дата'];

    for (var rowValue in rows) {
      colIterableSheet
          .cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: colIterableSheet.maxCols,
          ))
          .value = rowValue;
    }

    for (var colValue in sells) {
      colIterableSheet
          .cell(CellIndex.indexByColumnRow(
            rowIndex: colIterableSheet.maxRows,
            columnIndex: colIndex,
          ))
          .value = colValue.person.fullName;
      colIterableSheet
          .cell(CellIndex.indexByColumnRow(
            rowIndex: colIterableSheet.maxRows - 1,
            columnIndex: colIndex + 1,
          ))
          .value = colValue.sum;
      colIterableSheet
          .cell(CellIndex.indexByColumnRow(
            rowIndex: colIterableSheet.maxRows - 1,
            columnIndex: colIndex + 2,
          ))
          .value = colValue.dateSell.toIso8601String();
    }

    String outputFile = path ?? "/xls/r.xlsx";

    //stopwatch.reset();
    List<int>? fileBytes = excel.save();
    //print('saving executed in ${stopwatch.elapsed}');
    if (fileBytes != null) {
      File(join(outputFile))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }
  }
}
