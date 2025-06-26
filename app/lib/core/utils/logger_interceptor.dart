import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor(
    this.logger, {
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
  });

  final Logger logger;

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.balanceInfoModel]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logPrint('* Request *');
    _printKV('uri', options.uri);

    if (request) {
      _printKV('method', options.method);
      _printKV('responseType', options.responseType.toString());
      _printKV('followRedirects', options.followRedirects);
      _printKV('connectTimeout', options.connectTimeout?.inSeconds ?? 0);
      _printKV('receiveTimeout', options.receiveTimeout?.inSeconds ?? 0);
      _printKV('extra', options.extra);
    }
    if (requestHeader) {
      logPrint('headers:');
      options.headers.forEach((key, v) => _printKV(' $key', v));
    }
    if (requestBody) {
      logPrint('data:');
      _printAll(options.data);
    }
    logPrint('');
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (error) {
      _printKVError("", '* DioError *:');
      _printKVError("", 'uri: ${err.requestOptions.uri}');
      _printKVError("", '$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      logPrint('');
    }
    return super.onError(err, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    logPrint('* Response *');
    _printResponse(response);
    return super.onResponse(response, handler);
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    if (responseHeader) {
      _printKV('statusCode', response.statusCode ?? 0);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }
      logPrint('headers:');
      response.headers.forEach((key, v) => _printKV(' $key', v.join(',')));
    }
    if (responseBody) {
      logPrint('Response Text:');
      _printAll(response.toString());
    }
    logPrint('');
  }

  void _printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void _printKVError(String key, Object v) {
    logger.severe('$key: $v');
  }

  void _printAll(dynamic msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String text) {
    logger.info(text);
  }
}

// Init Root Logger

Logger logger = Logger("App Logger");

void initRootLogger() {
  // only enable logging for debug mode
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
  } else {
    Logger.root.level = Level.OFF;
  }
  hierarchicalLoggingEnabled = true;

  Logger.root.onRecord.listen((record) {
    if (!kDebugMode) {
      return;
    }

    var start = '\x1b[90m';
    const end = '\x1b[0m';
    // const white = '\x1b[37m';

    switch (record.level.name) {
      case 'INFO':
        start = '\x1b[92m';
        break;
      case 'WARNING':
        start = '\x1b[93m';
        break;
      case 'SEVERE':
        start = '\x1b[103m\x1b[31m';
        break;
      case 'SHOUT':
        start = '\x1b[41m\x1b[93m';
        break;
    }

    final message = '$end$start${record.message}$end';
    developer.log(
      message,
      // name: record.loggerName.padRight(25),
      level: record.level.value,
    );
  });
}
