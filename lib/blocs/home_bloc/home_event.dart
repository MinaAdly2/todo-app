part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ListEvent extends HomeEvent {}

class GridEvent extends HomeEvent {}
