part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ListEvent extends HomeEvent {}

class GridEvent extends HomeEvent {}

class SaveTaskEvent extends HomeEvent {
  final String title;
  final String task;
  SaveTaskEvent({required this.title, required this.task});
}
