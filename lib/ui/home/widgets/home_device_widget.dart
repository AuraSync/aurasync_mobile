part of '../home_screen.dart';

final class _HomeDeviceWidget extends StatelessWidget with AppThemeMixin {
  const _HomeDeviceWidget();

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    return ContainerWidget(
      padding: EdgeInsets.all(metrics.small),
      decoration: BoxDecoration(color: colors.surface),
      child: Row(
        spacing: metrics.medium,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox.square(dimension: 60, child: Placeholder()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                'Device Name',
                type: TextWidgetType.titleMedium,
              ),
              Row(
                spacing: metrics.small,
                children: [
                  const TextWidget('Connected'),
                  ContainerWidget(
                    width: metrics.small,
                    height: metrics.small,
                    decoration: BoxDecoration(
                      color: colors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
