// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    logger.i(
        '${bloc.runtimeType}: Change from current state:\n${change.currentState}');
    logger.i('${bloc.runtimeType}: to next state:\n${change.nextState}');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.i('${bloc.runtimeType} CLOSED.');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.i('${bloc.runtimeType} CREATED.');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.i('BLOC ERROR:\n$error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.i('${bloc.runtimeType}: Event \n$event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.i(transition);
    super.onTransition(bloc, transition);
  }
}
