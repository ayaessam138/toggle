import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togglebutton/cubit/lang_cubit.dart';
import 'package:togglebutton/theme_cubit.dart';
import 'package:togglebutton/toggleButton.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      startLocale: Locale('en'),
      fallbackLocale: Locale('en'),
      useOnlyLangCode: true,
      path: 'assets/traslations',
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LangCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LangCubit, LangState>(
            builder: (BuildContext context, state) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: Locale(BlocProvider.of<LangCubit>(context)
                    .languages[BlocProvider.of<LangCubit>(context).langindex]),
                title: 'Flutter Demo',
                theme: BlocProvider.of<ThemeCubit>(context).themes[
                    BlocProvider.of<ThemeCubit>(context)
                        .themindex], // The Mandy red, dark theme.
                darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
                // Use dark or light theme ba
                home: ToggleButtonRun(),
              );
            },
          );
        },
      ),
    );
  }
}
