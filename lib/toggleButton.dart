import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togglebutton/button.dart';
import 'package:togglebutton/theme_cubit.dart';

class ToggleButtonRun extends StatelessWidget {
  ToggleButtonRun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ToggleButtonsSample(title: 'theme'),
                    ));
              },
              child: Text('theme')),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ToggleButtonsSample2(title: 'localization'),
                    ));
              },
              child: Text('localization'))
        ],
      ),
    );
  }
}
