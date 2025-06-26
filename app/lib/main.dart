import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_template/core/di/injection.dart' show configureDependencies;

import 'app/app.dart';
import 'common/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(kDebugMode ? 'dev' : 'prod');

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();

  runApp(const App());
}
