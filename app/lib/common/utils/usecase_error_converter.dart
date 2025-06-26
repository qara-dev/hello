import 'package:rest_client/rest_client.dart' show AppFailure;

abstract interface class UseCaseErrorConverter<T> {
  T convert(Object error, StackTrace stackTrace);
}

final class AppFailureUseCaseErrorParser
    implements UseCaseErrorConverter<AppFailure> {
  const AppFailureUseCaseErrorParser();

  @override
  AppFailure convert(Object error, StackTrace stackTrace) {
    if (error is AppFailure) {
      return error;
    }

    throw error;
  }
}
