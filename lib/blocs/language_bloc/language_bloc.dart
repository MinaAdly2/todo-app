import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  Locale languageCode = Locale('en');

  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguageEvent>(_changeLanguageEvent);
  }

  FutureOr<void> _changeLanguageEvent(
      ChangeLanguageEvent event, Emitter<LanguageState> emit) {
    if (languageCode == Locale('en')) {
      languageCode = Locale('ar');
      emit(ArabicState());
    } else if (languageCode == Locale('ar')) {
      languageCode = Locale('en');
      emit(EnglishState());
    }
  }
}
