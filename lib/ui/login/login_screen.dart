import 'dart:async';
import 'dart:developer';

import 'package:aurasync/repositories/permission_repository.dart';
import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/services/permission_service.dart';
import 'package:aurasync/ui/_core/widgets/screen/screen_widget.dart';
import 'package:aurasync_engine/aurasync_engine.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_module.dart';
part 'login_view_model.dart';

final class _LoginScreen extends StatefulWidget {
  const _LoginScreen();

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

final class _LoginScreenState extends State<_LoginScreen> {
  late final _LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Modular.get<_LoginViewModel>();
    _viewModel.requestPermission.execute();
    _viewModel.discover.execute();
    _viewModel.advertise.execute();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      body: Center(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (_, _) => DeviceRadarWidget(
            dimension: 320,
            devices: _viewModel.devices,
            onPressed: (device) => log(device.name),
          ),
        ),
      ),
    );
  }
}
