part of 'lang_cubit.dart';

@immutable
sealed class LangState {}

final class LangInitial extends LangState {}

final class LangSelected extends LangState {}
