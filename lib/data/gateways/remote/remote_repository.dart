import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_may/di/app_locator.dart';
import 'package:first_may/model/person.dart';
import 'package:first_may/model/sells.dart';
import 'package:get_storage/get_storage.dart';

class RemoteRepository {
  static final Dio dio = Locator.injection();
  static final GetStorage store = Locator.injection();

  static const String basicPath = 'http://192.168.0.142:44199';

  static Future<List<Person>> getPersons() async {
    List<Person> list = [];
    try {
      Response response = await dio.get(
        '$basicPath/person',
      );
      // log(response.toString(), name: 'RemoteRepository.getPersons');

      for (var item in response.data) {
        list.add(Person.fromJson(item));
      }
    } catch (e, s) {
      log(e.toString(), name: 'RemoteRepository.getPersons');
      log(s.toString(), name: 'RemoteRepository.getPersons');
    }
    return list;
  }

  static Future<List<Sell>> getSells() async {
    List<Sell> list = [];
    try {
      Response response = await dio.get(
        '$basicPath/sells',
      );
      log(response.toString(), name: 'RemoteRepository.getSells');

      for (var item in response.data) {
        Sell sell = Sell.fromJson(item);
        if (sell.isPrimary == true) {
          list.add(sell);
        }
      }
    } catch (e, s) {
      log(e.toString(), name: 'RemoteRepository.getSells');
      log(s.toString(), name: 'RemoteRepository.getSells');
    }
    return list;
  }

  static Future<void> addSell(Sell sell) async {
    try {
      Response response = await dio.post(
        '$basicPath/sells/create',
        data: {
          //"idSell": sell.id,
          "sum": sell.sum,
          "dateSell": sell.dateSell.toIso8601String(),
          "idPerson": sell.person.serviceNumber,
        },
      );
      log(response.toString(), name: 'RemoteRepository.addSell');

      //for (var item in response.data) {
      //  list.add(Sell.fromJson(item));
      //}
    } catch (e, s) {
      log(e.toString(), name: 'RemoteRepository.addSell');
      log(s.toString(), name: 'RemoteRepository.addSell');
    }
  }

  static Future<void> updateSell(Sell sell) async {
    try {
      log(sell.id.toString(), name: 'RemoteRepository.updateSell');
      Response response = await dio.put(
        '$basicPath/sells/update',
        data: {
          "idSell": sell.id,
          "sum": sell.sum,
          "dateSell": sell.dateSell.toIso8601String(),
          "idPerson": sell.person.serviceNumber,
        },
      );
      log(response.toString(), name: 'RemoteRepository.updateSell');

      //for (var item in response.data) {
      //  list.add(Sell.fromJson(item));
      //}
    } catch (e, s) {
      log(e.toString(), name: 'RemoteRepository.updateSell');
      log(s.toString(), name: 'RemoteRepository.updateSell');
    }
  }
}
