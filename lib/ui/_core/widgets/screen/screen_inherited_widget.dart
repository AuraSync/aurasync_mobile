part of 'screen_widget.dart';

final class _ScreenInheritedWidget extends InheritedWidget {
  const _ScreenInheritedWidget({
    required this.extendBody,
    required this.padding,
    required this.body,
    required this.appBar,
    required this.bottom,
    required this.sidebar,
    required super.child,
  });

  factory _ScreenInheritedWidget.of(BuildContext context) {
    final instance = context
        .dependOnInheritedWidgetOfExactType<_ScreenInheritedWidget>();

    if (instance == null) {
      throw FlutterError(
        'No _ScreenInheritedWidget found in context. '
        'Make sure to wrap your widget tree with _ScreenInheritedWidget.',
      );
    }

    return instance;
  }

  final bool extendBody;
  final EdgeInsets padding;
  final Widget? body;
  final Widget? appBar;
  final Widget? bottom;
  final Widget? sidebar;

  @override
  bool updateShouldNotify(covariant _ScreenInheritedWidget oldWidget) {
    return oldWidget.body != body ||
        oldWidget.appBar != appBar ||
        oldWidget.bottom != bottom ||
        oldWidget.sidebar != sidebar ||
        oldWidget.padding != padding;
  }
}
