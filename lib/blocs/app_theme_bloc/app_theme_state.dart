part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeState {}

class AppThemeInitial extends AppThemeState {}

class DarkModeState extends AppThemeState {}

class LightModeState extends AppThemeState {}
