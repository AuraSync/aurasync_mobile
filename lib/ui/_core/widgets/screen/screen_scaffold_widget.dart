part of 'screen_widget.dart';

final class _ScreenScaffoldWidget extends StatelessWidget with AppThemeMixin {
  const _ScreenScaffoldWidget();

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);
    final inherited = _ScreenInheritedWidget.of(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: colors.surface,
      body: Center(child: inherited.body),
      bottomNavigationBar: inherited.bottom,
      appBar: _buildAppBar(metrics, inherited),
    );
  }

  PreferredSize? _buildAppBar(
    AppThemeMetricsExtension metrics,
    _ScreenInheritedWidget inherited,
  ) {
    if (inherited.appBar != null) {
      return PreferredSize(
        preferredSize: Size.fromHeight(metrics.appBar.maxHeight),
        child: inherited.appBar!,
      );
    }

    return null;
  }
}
