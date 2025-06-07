part of 'screen_widget.dart';

final class _ScreenViewerWidget extends StatelessWidget with AppThemeMixin {
  const _ScreenViewerWidget({
    required this.scale,
    required this.rotationY,
    required this.translateX,
  });

  final Animation<double> scale;
  final Animation<double> rotationY;
  final Animation<double> translateX;

  @override
  Widget build(BuildContext context) {
    final (colors, metrics) = getTheme(context);
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..translate(translateX.value)
      ..rotateY(rotationY.value)
      ..scale(scale.value);

    return Transform(
      transform: transform,
      alignment: Alignment.centerRight,
      filterQuality: FilterQuality.medium,
      child: ContainerWidget(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(metrics.radius * 2),
        ),
        child: const _ScreenScaffoldWidget(),
      ),
    );
  }
}
