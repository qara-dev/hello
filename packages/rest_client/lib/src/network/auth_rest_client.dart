import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:storage/storage.dart';

import 'auth_interceptor.dart';
import 'network_error_handler.dart';
import 'refresh_token_interceptor.dart';
import 'rest_client.dart';

class AuthRestClient extends RestClient {
  AuthRestClient(
    this._client,
    SecureStorage secureStorage,
    VoidCallback onTokenRefreshFailed,
  ) : super(_client, errorHandler: NetworkErrorHandlerImpl()) {
    _client.interceptors.addAll([
      AuthInterceptor(
        tokenGetter: () => secureStorage.getValue(SecureStorageKey.authToken),
      ),
      RefreshTokenInterceptor(
        secureStorage: secureStorage,
        authlessDio: Dio(BaseOptions(baseUrl: _client.options.baseUrl)),
        onTokenRefreshFailed: onTokenRefreshFailed,
      ),
    ]);
  }

  final Dio _client;
}
