import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial()) {
    on<DarkModeEvent>(_darkModeEvent);
    on<LightModeEvent>(_lightModeEvent);
  }
  FutureOr<void> _darkModeEvent(
      DarkModeEvent event, Emitter<AppThemeState> emit) {
    emit(DarkModeState());
  }

  FutureOr<void> _lightModeEvent(
      LightModeEvent event, Emitter<AppThemeState> emit) {
    emit(LightModeState());
  }
}
