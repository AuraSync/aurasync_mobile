import 'package:aurasync_ui/aurasync_ui.dart';
import 'package:flutter/material.dart';

part 'screen_viewer_widget.dart';
part 'screen_sidebar_widget.dart';
part 'screen_scaffold_widget.dart';
part 'screen_inherited_widget.dart';
part 'screen_widget_controller.dart';

final class ScreenWidget extends StatefulWidget {
  const ScreenWidget({
    this.extendBody = false,
    this.padding = EdgeInsets.zero,
    this.body,
    this.appBar,
    this.bottom,
    this.sidebar,
    this.controller,
    super.key,
  });

  final bool extendBody;
  final EdgeInsets padding;
  final Widget? body;
  final Widget? appBar;
  final Widget? bottom;
  final Widget? sidebar;
  final ScreenWidgetController? controller;

  @override
  State<StatefulWidget> createState() => _ScreenWidgetState();
}

final class _ScreenWidgetState extends State<ScreenWidget>
    with AppThemeMixin, SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;
  late final Animation<double> _rotationY;
  late final Animation<double> _translateX;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_controller != null) return;

    _initialize();
    widget.controller?.addListener(_controllerListener);
  }

  @override
  void dispose() {
    _controller?.dispose();
    widget.controller?.dispose();
    widget.controller?.removeListener(_controllerListener);
    super.dispose();
  }

  void _initialize() {
    final media = MediaQuery.of(context);
    final metrics = getThemeMetrics(context);

    _controller = AnimationController(
      vsync: this,
      duration: metrics.duration,
      reverseDuration: metrics.duration,
    );

    final animation = CurvedAnimation(
      parent: _controller!,
      curve: metrics.curve,
    );

    _scale = Tween<double>(begin: 1, end: 0.6).animate(animation);
    _opacity = Tween<double>(begin: 0, end: 1).animate(animation);
    _rotationY = Tween<double>(begin: 0, end: 0.6).animate(animation);
    _translateX = Tween<double>(
      begin: 0,
      end: media.size.width * 0.2,
    ).animate(animation);
  }

  void _controllerListener() {
    if (widget.controller?.isSidebarOpened ?? false) {
      _controller!.forward();
      return;
    }

    _controller!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null ||
        widget.sidebar == null ||
        widget.controller == null) {
      return _ScreenInheritedWidget(
        body: widget.body,
        appBar: widget.appBar,
        bottom: widget.bottom,
        sidebar: widget.sidebar,
        padding: widget.padding,
        extendBody: widget.extendBody,
        child: const _ScreenScaffoldWidget(),
      );
    }

    return _ScreenInheritedWidget(
      body: widget.body,
      appBar: widget.appBar,
      bottom: widget.bottom,
      sidebar: widget.sidebar,
      padding: widget.padding,
      extendBody: widget.extendBody,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (_, _) {
                return _ScreenSidebarWidget(
                  opacity: _opacity,
                  onClosePressed: widget.controller?.closeSidebar,
                );
              },
            ),
          ),
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (_, _) {
                return _ScreenViewerWidget(
                  scale: _scale,
                  rotationY: _rotationY,
                  translateX: _translateX,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
