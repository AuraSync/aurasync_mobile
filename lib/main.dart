import 'dart:developer';

import 'package:aurasync/app_builder.dart';
import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/ui/root/root_screen.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Command.reportAllExceptions = true;
  Command.globalExceptionHandler =
      (CommandError<dynamic> error, StackTrace stackTrace) {
        log(error.error.toString(), stackTrace: stackTrace);
      };

  await Future.wait([
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);

  runApp(
    ModularApp(
      module: RootModule(),
      child: const AuraSyncUIApp(child: MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

final class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Modular.setInitialRoute(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(context: context);

    return MaterialApp.router(
      title: 'AuraSync',
      debugShowCheckedModeBanner: false,
      theme: theme.getData(isDark: false),
      darkTheme: theme.getData(isDark: true),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      builder: (_, child) => AppBuilder(child: child),
    );
  }
}
