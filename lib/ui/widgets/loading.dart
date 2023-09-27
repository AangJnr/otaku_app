import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatelessWidget {
  final Color? pathBackgroundColor;
  final List<Color>? colors;
  final Size? size;

  const LoadingWidget(
      {this.colors,
      this.size = const Size(100, 100),
      this.pathBackgroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size!.width,
        height: size!.height,
        child: LoadingIndicator(
          indicatorType: Indicator.orbit,
          pathBackgroundColor: pathBackgroundColor,
          colors: colors,
        ),
      ),
    );
  }
}
