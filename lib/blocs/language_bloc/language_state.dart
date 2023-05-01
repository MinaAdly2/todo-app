part of 'language_bloc.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class EnglishState extends LanguageState {}

class ArabicState extends LanguageState {}