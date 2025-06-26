import 'dart:async';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:storage/storage.dart';

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor({
    required this.secureStorage,
    required this.authlessDio,
    this.onTokenRefreshFailed,
  });

  final SecureStorage secureStorage;
  final Dio authlessDio;
  final VoidCallback? onTokenRefreshFailed;

  bool _isRefreshing = false;
  final List<Completer<Response>> _retryQueue = [];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;

    final isUnauthorized = statusCode == 401;

    if (isUnauthorized) {
      final completer = Completer<Response>();
      _retryQueue.add(completer);

      if (!_isRefreshing) {
        _isRefreshing = true;

        try {
          final refreshToken = await secureStorage.getValue(
            SecureStorageKey.refreshToken,
          );
          if (refreshToken == null) {
            throw Exception("No refresh token");
          }

          final response = await authlessDio.post(
            '/auth/refresh',
            data: {'refresh_token': refreshToken},
          );

          final newAccessToken = response.data['access_token'];
          final newRefreshToken = response.data['refresh_token'];

          await secureStorage.setValue(
            SecureStorageKey.authToken,
            newAccessToken,
          );
          await secureStorage.setValue(
            SecureStorageKey.refreshToken,
            newRefreshToken,
          );

          // Повтор запросов
          while (_retryQueue.isNotEmpty) {
            final completer = _retryQueue.removeAt(0);
            final newOptions = _addToken(err.requestOptions, newAccessToken);
            try {
              final clone = await authlessDio.fetch(newOptions);
              completer.complete(clone);
            } catch (e) {
              completer.completeError(e);
            }
          }

          _isRefreshing = false;
          return;
        } catch (e) {
          // Ошибка обновления токена
          _isRefreshing = false;
          _retryQueue.clear();
          await secureStorage.deleteValue(SecureStorageKey.authToken);
          await secureStorage.deleteValue(SecureStorageKey.refreshToken);
          onTokenRefreshFailed?.call();
        }
      }

      try {
        final response = await completer.future;
        handler.resolve(response);
      } catch (e) {
        handler.reject(err);
      }
      return;
    }

    handler.next(err);
  }

  RequestOptions _addToken(RequestOptions request, String token) {
    final newHeaders = Map<String, dynamic>.from(request.headers);
    newHeaders['Authorization'] = 'Bearer $token';
    return request.copyWith(headers: newHeaders);
  }
}
