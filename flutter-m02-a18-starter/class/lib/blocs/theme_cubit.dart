import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(Brightness platformBrightness)
      : super(platformBrightness == Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark);

  void toggleThemeMode() =>
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
}
