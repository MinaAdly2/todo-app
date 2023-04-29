part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class SaveTaskEvent extends TaskEvent {
  final String title;
  final String task;
  SaveTaskEvent({required this.title, required this.task});
}

class DeleteTaskEvent extends TaskEvent {
  final TaskModel taskModel;
  DeleteTaskEvent({required this.taskModel});
}
