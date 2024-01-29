import 'package:otaku_katarougu_app/ui/widgets/mouse_transforms/scale_on_hover.dart';
import 'package:otaku_katarougu_app/ui/widgets/mouse_transforms/translate_on_hover.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension HoverExtensions on Widget {
  Widget get showCursorOnHover {
    return _returnUnalteredOnMobile(MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
    ));
  }

  /// Moves the widget by x,y pixels on hover
  ///
  /// to move up use -y values, to move left use -x values
  Widget moveOnHover({double? x, double? y}) {
    return _returnUnalteredOnMobile(TranslateOnHover(
      x: x,
      y: y,
      child: this,
    ));
  }

  /// Scales the widget by [scale] on hover
  Widget scaleOnHover({double scale = 1.1}) {
    return _returnUnalteredOnMobile(ScaleOnHover(
      scale: scale,
      child: this,
    ));
  }

  /// Takes in the alteredWidget and if we detect we're on Android or iOS
  /// we return the unaltered widget.
  ///
  /// The reason we can do this is because all altered widgets require mouse
  /// functionality to work.
  Widget _returnUnalteredOnMobile(Widget alteredWidget) {
    if (kIsWeb) {
      return alteredWidget;
    }
    return this;
  }
}

extension StringToColor on String? {
  Color hexToColor() {
    if (this?.isEmpty == true) return const Color(0xFFE1E1E1);
    return Color(int.parse(this!.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

extension DaysToYearConverter on int {
  String toYear() {
    return "/year";
    if (this == 0) return 'N/a';
    final value = this ~/ 365 + (this % 365);
    return value > 1 ? "/ $value years" : "/ $value year";
  }
}
