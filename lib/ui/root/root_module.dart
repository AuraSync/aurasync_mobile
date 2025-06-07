part of 'root_screen.dart';

final class RootModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ScreenWidgetController>(ScreenWidgetController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.root, child: (_) => const _RootScreen());
  }
}
