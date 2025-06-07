import 'package:aurasync/routing/app_routes.dart';
import 'package:aurasync/ui/_core/widgets/screen/screen_widget.dart';
import 'package:aurasync/ui/_core/widgets/sidebar/sidebar_widget.dart';
import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'root_module.dart';

final class _RootScreen extends StatelessWidget {
  const _RootScreen();

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ScreenWidgetController>();

    return ScreenWidget(
      controller: controller,
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
