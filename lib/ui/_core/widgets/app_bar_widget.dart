import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final class AppBarWidget extends StatelessWidget with AppThemeMixin {
  const AppBarWidget({
    this.implyLeading = true,
    this.title,
    this.leading,
    super.key,
  });

  final bool implyLeading;
  final String? title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);
    final canPop = implyLeading && Modular.to.canPop();

    return ContainerWidget(
      decoration: BoxDecoration(color: colors.background),
      padding: EdgeInsets.symmetric(
        vertical: metrics.small,
        horizontal: metrics.medium,
      ).copyWith(top: metrics.medium),
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Row(
          spacing: metrics.small,
          children: [
            if (leading != null && !canPop) leading!,
            if (canPop)
              IconButtonWidget(
                onPressed: Modular.to.pop,
                icon: SolarLinearIcons.arrowLeft,
              ),
            if (title != null)
              TextWidget(title!, type: TextWidgetType.headlineMedium),
          ],
        ),
      ),
    );
  }
}
