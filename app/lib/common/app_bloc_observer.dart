import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

final _logger = Logger('BlocObserver');

/// Bloc observer for logging all bloc events, transitions, and errors
class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.info(
      '[BLOC TRANSITION] ${bloc.runtimeType}\n'
      'Event: ${transition.event.runtimeType}\n'
      'Transition: ${transition.currentState.runtimeType} => ${transition.nextState.runtimeType}\n'
      'New State: ${_limit(transition.nextState?.toString(), 200)}',
    );
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.severe(
      '[BLOC ERROR] ${bloc.runtimeType}\n$error',
      error,
      stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.fine(
      '[BLOC EVENT] ${bloc.runtimeType}\nEvent: ${event.runtimeType}\nDetails: ${_limit(event?.toString(), 200)}',
    );
    super.onEvent(bloc, event);
  }
}

String _limit(String? value, int length) {
  if (value == null) return '';
  return value.length > length ? value.substring(0, length) : value;
}
