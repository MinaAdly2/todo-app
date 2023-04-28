import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mmd/models/task_model.dart';
import 'package:todo_mmd/models/tasks_list.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GridEvent>(_gridEvent);
    on<ListEvent>(_listEvent);
    on<SaveTaskEvent>(_saveTaskEvent);
  }

  FutureOr<void> _gridEvent(GridEvent event, Emitter<HomeState> emit) {
    emit(HomeGridState());
  }

  FutureOr<void> _listEvent(ListEvent event, Emitter<HomeState> emit) {
    emit(HomeListState());
  }

  FutureOr<void> _saveTaskEvent(SaveTaskEvent event, Emitter<HomeState> emit) {
    try {
      saveTask(title: event.title, task: event.task);
      emit(SaveTaskSuccessState());
    } catch (e) {
      emit(FailureState());
    }
  }

  void saveTask({required String title, required String task}) {
    tasksList.add(TaskModel(title: title, task: task));
    debugPrint('Save Successfully');
  }
}
