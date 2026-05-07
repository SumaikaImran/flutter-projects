// ignore_for_file: depend_on_referenced_packages


import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:phone_eats_first/src/core/services/local_db_service/secure_storage.dart';
import 'package:phone_eats_first/src/core/services/network_service/api_service.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';


final locator = GetIt.instance;

setupLocator() {
  appPrint("***Setup Registry***");
  locator.registerLazySingleton<Prefs>(() => Prefs());
  locator.registerLazySingleton<Client>(() => Client());
  
  locator.registerLazySingleton<ApiService>(() => ApiService());
  



  locator.registerLazySingleton(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions.defaultOptions,
    ),
  );
}
