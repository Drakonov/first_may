import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_may/di/app_locator.dart';
import 'package:first_may/model/person.dart';
import 'package:get_storage/get_storage.dart';

class RemoteRepository {
  static final Dio dio = Locator.injection();
  static final GetStorage store = Locator.injection();

  static Future<List<Person>> getPersons() async {
    List<Person> list = [];
    try {
      Response response = await dio.get(
        'http://192.168.1.32:44199/person',
      );
      log(response.toString(), name: 'RemoteRepository.getPersons');

      for (var item in response.data) {
        list.add(Person.fromJson(item));
      }
    } catch (e, s) {
      log(e.toString(), name: 'RemoteRepository.getPersons');
      log(s.toString(), name: 'RemoteRepository.getPersons');
    }
    return list;
  }
}
