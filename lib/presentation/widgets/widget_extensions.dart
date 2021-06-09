
import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {

  Widget inSafeArea() {
    return SafeArea(child: this);
  }

  Align aligned({Alignment alignment = Alignment.center, double? widthFactor, double? heightFactor}) {
    return Align(alignment: alignment, widthFactor: widthFactor, heightFactor: heightFactor, child: this);
  }

  Center centered({double? widthFactor, double? heightFactor}) => Center(child: this, widthFactor: widthFactor, heightFactor: heightFactor);

  Padding padded(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  Padding paddedFromLTRB(double left, double top, double right, double bottom) {
    return Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);
  }

  Padding paddedAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  Padding paddedOnly({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0}) {
    return Padding(padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom), child: this);
  }

  FittedBox scaledToFit({BoxFit fit = BoxFit.scaleDown}) {
    return FittedBox(fit: fit, child: this);
  }

  Expanded expanded({Key? key, int flex = 1}) {
    return Expanded(key: key, flex: flex, child: this);
  }

  Flexible flexible({flex = 1, fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  Widget opacity(double opacity) {
    if (opacity == 1)
      return this;
    else
      return Opacity(opacity: opacity, child: this);
  }
}


extension NavigatorStateExtensions on NavigatorState {
  void popToRoot() {
    popUntil((route) => route.settings.name == '/');
  }
}