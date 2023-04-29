import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GridEvent>(_gridEvent);
    on<ListEvent>(_listEvent);
  }

  FutureOr<void> _gridEvent(GridEvent event, Emitter<HomeState> emit) {
    emit(HomeGridState());
  }

  FutureOr<void> _listEvent(ListEvent event, Emitter<HomeState> emit) {
    emit(HomeListState());
  }
}
