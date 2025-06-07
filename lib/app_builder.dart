import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBuilder extends StatelessWidget with AppThemeMixin {
  const AppBuilder({required this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    _setSystemUI(context);
    return Material(child: child);
  }

  void _setSystemUI(BuildContext context) {
    final themeBrightness = getThemeBrightness(context);

    final Brightness brightness;
    switch (themeBrightness) {
      case Brightness.light:
        brightness = Brightness.dark;
      case Brightness.dark:
        brightness = Brightness.light;
    }

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
  }
}
