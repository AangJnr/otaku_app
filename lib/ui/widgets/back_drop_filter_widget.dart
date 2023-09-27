import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/utilities.dart';
import 'material_inkwell.dart';

class BlurView extends StatelessWidget {
  final Widget? child;
  final List<Alignment>? alignments;
  final VoidCallback? dismissable;
  final Alignment alignment;
  const BlurView(
      {Key? key,
      this.alignment = Alignment.center,
      this.child,
      this.alignments,
      this.dismissable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils.size(context);

    return MaterialInkWell(
      onTap: dismissable,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7.0,
                sigmaY: 7.0,
              ),
              child: const SizedBox.expand(),
            ),
            if (child != null) Align(alignment: alignment, child: child!),
          ],
        ),
      ),
    );
  }
}
