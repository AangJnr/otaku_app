import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? iconUrl;
  final String label;
  final VoidCallback? onTap;
  final Color? color;
  final IconData? iconData;
  final Size? size;
  final bool showText;
  final EdgeInsetsGeometry? padding;
  const PrimaryButtonWidget(this.label,
      {this.color,
      this.iconData,
      this.showText = false,
      this.size,
      this.padding = const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      this.iconUrl,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    return Opacity(
      opacity: onTap == null ? 0.4 : 1,
      child: Material(
          color: color,
          elevation: 5,
          borderRadius: borderRadius,
          child: InkWell(
              onTap: onTap,
              splashColor: Colors.white.withOpacity(0.3),
              borderRadius: borderRadius,
              hoverColor: Colors.white.withOpacity(0.3),
              child: Container(
                constraints: showText
                    ?const BoxConstraints(minWidth: 200)
                    : const BoxConstraints(minWidth: 60, minHeight: 60),
                padding:showText? padding:const EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: borderRadius),
                child: showText? Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconData != null) ...[
                      FaIcon(
                        iconData,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                    Text(
                      label,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyLarge
                          ?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    if (iconData != null)
                      const SizedBox(
                        width: 40,
                      )
                  ],
                ):FaIcon(
                  iconData,
                  color: Colors.white,
                  size: 20,
                ),
              ))),
    );
  }
}
