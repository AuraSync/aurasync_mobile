part of 'screen_widget.dart';

final class _ScreenSidebarWidget extends StatelessWidget with AppThemeMixin {
  const _ScreenSidebarWidget({
    required this.opacity,
    required this.onClosePressed,
  });

  final Animation<double> opacity;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final (colors, metrics) = getTheme(context);
    final inherited = _ScreenInheritedWidget.of(context);

    final padding = EdgeInsets.only(
      right: (media.size.width * 0.22) + metrics.medium,
    );

    return ContainerWidget(
      padding: EdgeInsets.all(metrics.medium),
      decoration: BoxDecoration(color: colors.background),
      child: Opacity(
        opacity: opacity.value,
        child: SafeArea(
          left: false,
          right: false,
          child: Column(
            spacing: metrics.medium,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButtonWidget(
                    isFilled: true,
                    onPressed: onClosePressed,
                    icon: SolarLinearIcons.close,
                  ),
                ],
              ),
              Expanded(
                child: Padding(padding: padding, child: inherited.sidebar),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
