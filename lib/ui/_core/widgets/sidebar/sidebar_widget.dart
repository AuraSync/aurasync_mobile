import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';

part 'sidebar_item_widget.dart';

final class SidebarWidget extends StatelessWidget with AppThemeMixin {
  const SidebarWidget({required this.index, required this.items, super.key});

  final int index;
  final List<SidebarItem> items;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return Column(
      spacing: metrics.medium,
      children: List.generate(items.length, (i) {
        return _SidebarItemWidget(item: items[i], isActive: i == index);
      }),
    );
  }
}
