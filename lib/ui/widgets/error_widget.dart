import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/ui_helpers.dart';
import 'primary_button_widget.dart';

class AErrorWidget extends StatelessWidget {
  const AErrorWidget(
      {super.key,
      this.positiveAction,
      this.positiveText = 'OK',
      this.negativeAction,
      this.negativeText = "Cancel",
      this.buttonColor,
      this.child,
      this.message});

  final VoidCallback? positiveAction;
  final String? positiveText;
  final VoidCallback? negativeAction;
  final String? negativeText;
  final Color? buttonColor;
  final String? message;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpaceMedium,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Oops, Our Server\'s Playing\n',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.4,
                    color: Colors.black,
                    fontSize: 30),
              ),
              TextSpan(
                text: 'Hide and Seek!',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.4,
                      color: Colors.red,
                      fontSize: 30,
                    ),
              ),
            ],
          ),
        ),
        verticalSpaceLarge,
        Flexible(
          child: Text(
            message ??
                "It seems our server decided to take a coffee break ☕! We're working diligently to coax it out of hiding. Thanks for your patience as we chase those digital gremlins away!",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: kcMediumGrey),
            maxLines: 3,
            softWrap: true,
          ),
        ),
        verticalSpaceMedium,
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (negativeAction != null)
              PrimaryButtonWidget(
                negativeText!,
                onTap: negativeAction,
                showText: true,
                color: Colors.red[400],
              ),
            horizontalSpaceMedium,
            if (positiveAction != null)
              PrimaryButtonWidget(
                positiveText!,
                onTap: positiveAction,
                showText: true,
                color: buttonColor,
              ),
          ],
        ),
        if (child != null) ...[  verticalSpaceMedium,child!]
      ],
    );
  }
}
