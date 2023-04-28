part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeEvent {}

class DarkModeEvent extends AppThemeEvent {}

class LightModeEvent extends AppThemeEvent {}