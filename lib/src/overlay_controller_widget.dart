import 'dart:async';

import 'package:flutter/cupertino.dart';

class OverlayControllerWidgetState {
  Widget? widget;
  bool? visible;
  OverlayControllerWidgetState({this.widget, this.visible});
}

///The inherited widget that guarantees the behavior of the overlay
class OverlayControllerWidget extends InheritedWidget {
  OverlayControllerWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static OverlayControllerWidget? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<OverlayControllerWidget>();

  final StreamController<Map<String, dynamic>> visibilityController = StreamController();
  final _state = OverlayControllerWidgetState();

  Stream<Map<String, dynamic>> get visibilityStream => visibilityController.stream;

  bool get visible => _state.visible ?? false;
  Widget? get widget => _state.widget;

  ///Set the visibility of the overlay
  void setOverlayVisible(
    bool loading, {
    Widget? widget,
  }) {
    _state.visible = loading;
    _state.widget = widget;
    visibilityController.add(<String, dynamic>{
      'loading': loading,
      'widget': widget,
    });
  }

  ///Dispose the controller
  void dispose() => visibilityController.close();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
