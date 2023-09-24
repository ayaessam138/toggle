import 'package:bloc/bloc.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  int themindex = 0;
  final List<ThemeData> themes = [
    FlexThemeData.dark(scheme: FlexScheme.purpleBrown),
    FlexThemeData.light(scheme: FlexScheme.mandyRed),
    FlexThemeData.light(scheme: FlexScheme.flutterDash),
    FlexThemeData.light(scheme: FlexScheme.deepOrangeM3)
  ];
  final List<bool> selecteedTheme = <bool>[true, false, false, false];
  final List<Widget> themesnames = [
    Text('purpleBrown'),
    Text('mandyRed'),
    Text('flutterDash'),
    Text('flutterDash')
  ];

  changeSelectedtheme(int newindex) {
    for (int index = 0; index < selecteedTheme.length; index++) {
      if (index == newindex) {
        selecteedTheme[index] = true;
      } else {
        selecteedTheme[index] = false;
      }
    }

    themindex = newindex;
    emit(ThemeModeChaged());
  }
}
