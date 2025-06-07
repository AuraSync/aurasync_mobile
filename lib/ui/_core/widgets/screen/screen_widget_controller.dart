part of 'screen_widget.dart';

final class ScreenWidgetController extends ChangeNotifier {
  bool _isSidebarOpened = false;

  bool get isSidebarOpened => _isSidebarOpened;

  void openSidebar() {
    _isSidebarOpened = true;
    notifyListeners();
  }

  void closeSidebar() {
    _isSidebarOpened = false;
    notifyListeners();
  }
}
