import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'material_inkwell.dart';

class CircleIconButtonWidget extends StatelessWidget {
  const CircleIconButtonWidget({
    super.key,
    this.label,
    this.style,
    this.onTap,
    this.iconData,
    this.assetUrl,
    this.color,
    this.textColor,
  });

  final String? label;
  final TextStyle? style;
  final VoidCallback? onTap;
  final IconData? iconData;
  final String? assetUrl;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialInkWell(
      onTap: onTap,
      splashColor: Colors.grey[200],
      padding: const EdgeInsets.all(12),
      radiusValue: 30,
      color: color,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (assetUrl == null)
          FaIcon(
            iconData,
            color: Colors.black,
            size: 14,
          )
        else
          Image.asset(
            assetUrl!,
            height: 30,
            width: 30,
            // color: textColor,
          ),
        // if (!!kIsWeb) ...[
        //   const SizedBox(
        //     width: 10,
        //   ),
        //   Text(label, style: style?.copyWith(color: textColor))
        // ]
      ]),
    );
  }
}
