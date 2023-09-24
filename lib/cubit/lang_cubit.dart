import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());

  int langindex = 0;
  final List<String> languages = ['ar', 'en'];
  final List<bool> selecteedlang = <bool>[true, false];
  final List<Widget> langnames = [
    Text('arabic'),
    Text('english'),
  ];
  changeSelectedtlang(int newindex) {
    for (int index = 0; index < selecteedlang.length; index++) {
      if (index == newindex) {
        selecteedlang[index] = true;
      } else {
        selecteedlang[index] = false;
      }
    }

    langindex = newindex;
    emit(LangSelected());
  }
}
