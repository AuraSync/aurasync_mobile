part of 'screen_widget.dart';

final class _ScreenScaffoldWidget extends StatelessWidget with AppThemeMixin {
  const _ScreenScaffoldWidget();

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);
    final inherited = _ScreenInheritedWidget.of(context);

    return Scaffold(
      backgroundColor: colors.surface,
      extendBody: inherited.extendBody,
      extendBodyBehindAppBar: inherited.extendBody,
      appBar: _buildAppBar(metrics, inherited),
      bottomNavigationBar: inherited.bottom,
      body: Padding(
        padding: inherited.padding,
        child: Center(child: inherited.body),
      ),
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
