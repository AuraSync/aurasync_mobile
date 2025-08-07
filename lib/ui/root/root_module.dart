part of 'root_screen.dart';

final class RootModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      ..addSingleton<ScreenWidgetController>(ScreenWidgetController.new)
      ..addSingleton<RootViewModel>(
        () => RootViewModel(
          PermissionRepositoryImpl(PermissionService()),
        ),
      );
  }

  @override
  void routes(RouteManager r) {
    r
      ..module(AppRoutes.login, module: LoginModule())
      ..child(
        AppRoutes.root,
        child: (_) => const _RootScreen(),
        children: [ModuleRoute(AppRoutes.home, module: HomeModule())],
      );
  }
}
