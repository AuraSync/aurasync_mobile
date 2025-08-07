import 'package:aurasync/repositories/permission_repository.dart';
import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/services/permission_service.dart';
import 'package:aurasync/ui/_core/widgets/screen/screen_widget.dart';
import 'package:aurasync/ui/_core/widgets/sidebar/sidebar_widget.dart';
import 'package:aurasync/ui/home/home_screen.dart';
import 'package:aurasync/ui/login/login_screen.dart';
import 'package:aurasync/ui/root/root_view_model.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'root_module.dart';

final class _RootScreen extends StatefulWidget {
  const _RootScreen();

  @override
  State<StatefulWidget> createState() => _RootScreenState();
}

final class _RootScreenState extends State<_RootScreen> {
  late final RootViewModel _viewModel;
  late final ScreenWidgetController _controller;

  @override
  void initState() {
    super.initState();
    _viewModel = Modular.get<RootViewModel>();
    _controller = Modular.get<ScreenWidgetController>();

    _viewModel.requestPermission.execute();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      controller: _controller,
      body: const RouterOutlet(),
      sidebar: const SidebarWidget(
        index: 0,
        items: [
          SidebarItem(
            text: 'About us',
            icon: SolarLinearIcons.infoCircle,
            activeIcon: SolarBoldIcons.infoCircle,
          ),
          SidebarItem(
            text: 'Settings',
            icon: SolarLinearIcons.settingsMinimalistic,
            activeIcon: SolarBoldIcons.settingsMinimalistic,
          ),
        ],
      ),
    );
  }
}
