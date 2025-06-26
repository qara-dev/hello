import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hello/core/di/injection.dart';
import 'package:hello/core/utils/logger_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_client/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

@module
abstract class RegisterModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences async {
    initRootLogger();
    return await SharedPreferences.getInstance();
  }

  Dio get _dio {
    final dio = Dio(
      BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'),
    );
    if (kDebugMode) {
      final loggerInterceptor = LoggerInterceptor(
        logger,
        request: true,
        requestBody: true,
        error: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
      );
      dio.interceptors.add(loggerInterceptor);
    }
    return dio;
  }

  @lazySingleton
  LocalStorage get localStorage => LocalStorageImpl(getIt<SharedPreferences>());

  @lazySingleton
  SecureStorage get secureStorage =>
      SecureStorageImpl(localStorage: getIt<LocalStorage>());

  @lazySingleton
  AuthRestClient get authRestClient =>
      AuthRestClient(_dio, getIt<SecureStorage>(), () {
        // Handle token refresh failure
        log("Token refresh failed", name: "REFRESH_TOKEN");
      });

  @lazySingleton
  UnAuthRestClient get unAuthRestClient => UnAuthRestClient(_dio);

  @lazySingleton
  AppService get appService => AppService(localStorage: localStorage);
}
