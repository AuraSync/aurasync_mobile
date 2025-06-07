part of 'sidebar_widget.dart';

final class _SidebarItemWidget extends StatelessWidget with AppThemeMixin {
  const _SidebarItemWidget({required this.item, required this.isActive});

  final SidebarItem item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);

    final Color bgColor;
    final Color fgColor;
    if (isActive) {
      bgColor = colors.primary;
      fgColor = colors.onPrimary;
    } else {
      bgColor = colors.background;
      fgColor = colors.onBackground;
    }

    return ContainerWidget(
      padding: EdgeInsets.symmetric(
        vertical: metrics.medium,
        horizontal: metrics.small,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(metrics.radius),
      ),
      child: Row(
        spacing: metrics.small,
        children: [
          IconWidget(item.icon, color: fgColor),
          TextWidget(item.text, color: fgColor),
        ],
      ),
    );
  }
}

final class SidebarItem {
  const SidebarItem({
    required this.text,
    required this.icon,
    required this.activeIcon,
  });

  final String text;
  final IconData icon;
  final IconData activeIcon;
}
