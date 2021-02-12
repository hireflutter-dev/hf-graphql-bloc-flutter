import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    log(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    log(change.toString());
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    log(error.toString());
    super.onError(cubit, error, stackTrace);
  }
}
