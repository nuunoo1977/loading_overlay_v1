import 'package:flutter/material.dart';

import 'overlay_controller_widget.dart';

///Just a extension to make it cleaner to show or hide the overlay
extension OverlayControllerWidgetExtension on BuildContext {
  @Deprecated('Use context.loaderOverlay instead')
  OverlayControllerWidget? getOverlayController() => OverlayControllerWidget.of(this);

  ///Extension created to show the overlay
  @Deprecated('Use context.loaderOverlay.show() instead')
  void showLoaderOverlay({
    Widget? widget,
  }) =>
      getOverlayController()!.setOverlayVisible(true, widget: widget);

  ///Extension created to hide the overlay
  @Deprecated('Use context.loaderOverlay.hide() instead')
  void hideLoaderOverlay() => getOverlayController()?.setOverlayVisible(false);

  _OverlayExtensionHelper get loaderOverlay =>
      _OverlayExtensionHelper(OverlayControllerWidget.of(this));
}

class _OverlayExtensionHelper {
  OverlayControllerWidget? _overlayController;

  OverlayControllerWidget? get overlayController => _overlayController;
  bool get visible => _overlayController?.visible ?? false;

  _OverlayExtensionHelper(OverlayControllerWidget? overlayController) {
    _overlayController = overlayController;
  }

  Type? get overlayWidgetType => _overlayController?.widget?.runtimeType;

  void show({Widget? widget}) => _overlayController?.setOverlayVisible(true, widget: widget);

  void hide() => _overlayController?.setOverlayVisible(false);
}
