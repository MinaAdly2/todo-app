part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class SaveTaskSuccessState extends TaskState {}

class SaveTaskFailureState extends TaskState {}

class DeleteTaskSuccessState extends TaskState {}

class DeleteTaskFailureState extends TaskState {}
