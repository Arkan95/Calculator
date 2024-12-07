part of 'theme_bloc_bloc.dart';

@immutable
sealed class ThemeBlocEvent {}

final class ChangeToDark extends ThemeBlocEvent {}

final class ChangeToLight extends ThemeBlocEvent {}
