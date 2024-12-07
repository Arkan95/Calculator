import 'package:bloc/src/bloc.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';

class ThemeBlocBloc extends Bloc<ThemeBlocEvent, ThemeBlocState> {
  ThemeBlocBloc() : super(ThemeBlocDark()) {
    on<ThemeBlocEvent>(changeTheme);
  }

  void changeTheme(ThemeBlocEvent event, Emitter<ThemeBlocState> emit) {
    if (event is ChangeToDark) {
      emit(ThemeBlocDark());
    } else if (event is ChangeToLight) {
      emit(ThemeBlocLight());
    } else {
      emit(ThemeBlocDark());
    }
  }
}
