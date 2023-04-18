import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:first_may/app/bloc/app_bloc.dart';
import 'package:first_may/app/navigation/app_router.dart';
import 'package:first_may/core/network/network_info.dart';
import 'package:first_may/data/gateways/local/preferences_local_gateway.dart';

import 'package:first_may/utils/store_launcher.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Locator {
  static GetIt injection = GetIt.I;

  static Future<void> initBeforeAppLaunch() async {


    injection.registerSingleton<GetStorage>(GetStorage());
    await GetStorage.init();
    injection.registerSingleton<AppRouter>(AppRouter());
    injection.registerSingleton<Dio>(Dio());
    injection.registerSingleton<AppBloc>(AppBloc());
    injection.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
    injection.registerSingleton<DeviceInfoPlugin>(DeviceInfoPlugin());
    injection.registerSingleton<PackageInfo>(await PackageInfo.fromPlatform());
    injection.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
    injection.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker());
    injection.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(injection()),
    );
    injection.registerSingleton<StoreLauncher>(StoreLauncher());
    injection.registerSingleton<PreferencesLocalGateway>(
      PreferencesLocalGateway(
        flutterSecureStorage: injection(),
        sharedPreferences: injection(),
      ),
    );
  }

  static Future<void> initAfterAppLaunch() async {
    //AppConfig config = AppConfig.instance!;
    //injection.registerSingleton<AppConfig>(config);
    //injection.registerSingleton<Dio>(
    //  await DioHelper.getDio(
    //    preferencesLocalGateway: injection(),
    //    baseUrl: config.apiUrl,
    //    appRouter: injection(),
    //  ),
    //);
  }
}
