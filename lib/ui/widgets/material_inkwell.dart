import 'package:flutter/material.dart';

class MaterialInkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Color? color;
  final Color? splashColor;

  final Color? shadowColor;
  final double paddingValue;
  final double elevation;
  final double radiusValue;
  final EdgeInsets? padding;
  const MaterialInkWell(
      {this.onTap,
      this.child,
      this.padding,
      this.elevation = 0.0,
      this.paddingValue = 0,
      this.radiusValue = 0.0,
      this.color = Colors.transparent,
      this.splashColor = Colors.transparent,
      this.shadowColor = Colors.black38,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: color,
        shadowColor: shadowColor,
        elevation: elevation,
        borderRadius: BorderRadius.circular(radiusValue),
        child: InkWell(
            onTap: onTap,
            splashColor: splashColor?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(radiusValue),
            hoverColor: splashColor?.withOpacity(0.5),
            child: Padding(
              padding: padding ?? EdgeInsets.all(paddingValue),
              child: child,
            )));
  }
}
