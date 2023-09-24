import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togglebutton/cubit/lang_cubit.dart';
import 'package:togglebutton/theme_cubit.dart';

class ToggleButtonsSample extends StatelessWidget {
  final String title;

  bool vertical = false;

  ToggleButtonsSample({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(),
      ),
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Single-select', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {
                      BlocProvider.of<ThemeCubit>(context)
                          .changeSelectedtheme(index);
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: Colors.red[700],
                    selectedColor: Colors.white,
                    fillColor: Colors.red[200],
                    color: Colors.red[400],
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    isSelected:
                        BlocProvider.of<ThemeCubit>(context).selecteedTheme,
                    children: BlocProvider.of<ThemeCubit>(context).themesnames,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ToggleButtonsSample2 extends StatelessWidget {
  final String title;

  bool vertical = false;

  ToggleButtonsSample2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(),
      ),
      body: Center(
        child: BlocBuilder<LangCubit, LangState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Single-select', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 5),
                  ToggleButtons(
                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {
                      BlocProvider.of<LangCubit>(context)
                          .changeSelectedtlang(index);
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: Colors.red[700],
                    selectedColor: Colors.white,
                    fillColor: Colors.red[200],
                    color: Colors.red[400],
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    isSelected:
                        BlocProvider.of<LangCubit>(context).selecteedlang,
                    children: BlocProvider.of<LangCubit>(context).langnames,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
