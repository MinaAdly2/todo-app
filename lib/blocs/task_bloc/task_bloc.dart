import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_mmd/models/task_model.dart';
import 'package:todo_mmd/models/tasks_list.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<SaveTaskEvent>(_saveTaskEvent);
    on<DeleteTaskEvent>(_deleteEvent);
  }

  void saveTask({required String title, required String task}) {
    tasksList.add(TaskModel(title: title, task: task));
    debugPrint('Save Successfully');
  }

  void deleteTask({required TaskModel taskModel}) {
    int index = tasksList.indexOf(taskModel);
    tasksList.removeAt(index);
    debugPrint('Delete Successfully');
  }

  FutureOr<void> _saveTaskEvent(SaveTaskEvent event, Emitter<TaskState> emit) {
    try {
      saveTask(title: event.title, task: event.task);
      emit(SaveTaskSuccessState());
    } catch (e) {
      emit(SaveTaskFailureState());
    }
  }

  FutureOr<void> _deleteEvent(DeleteTaskEvent event, Emitter<TaskState> emit) {
    try {
      deleteTask(taskModel: event.taskModel);
      emit(DeleteTaskSuccessState());
    } catch (e) {
      emit(DeleteTaskFailureState());
    }
  }
}
