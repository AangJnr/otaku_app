import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../logo_widget.dart';
import 'footer_viewmodel.dart';

class Linkswidget extends StackedView<FooterViewModel> {
  final bool showFooterLogo;
  const Linkswidget({this.showFooterLogo = true, super.key});

  @override
  Widget builder(
      BuildContext context, FooterViewModel viewModel, Widget? child) {
    final theme = viewModel.appTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showFooterLogo) const LogoWidget(size: Size(70, 70)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "© ${DateTime.now().year} Otaku Tec. All rights reserved",
              style: Theme.of(context)
                  .primaryTextTheme
                  .displayMedium
                  ?.copyWith(fontSize: 13, color: theme.primaryTextColor),
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Terms of Service',
                      recognizer: viewModel.termsOfServiceRecognizer,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .displayMedium
                          ?.copyWith(
                              height: 1.4,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: theme.primaryTextColor)),
                  TextSpan(
                    text: ' and ',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .displayMedium
                        ?.copyWith(
                            height: 1.4,
                            fontSize: 12,
                            color: theme.primaryTextColor),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    recognizer: viewModel.policyRecognizer,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .displayMedium
                        ?.copyWith(
                            height: 1.4,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: theme.primaryTextColor),
                  ),
                ],
              ),
            ),
            horizontalSpaceMedium,
            GestureDetector(
              onTap: viewModel.triggerSendEmailIntent,
              child: Text(
                'Share your feedback!',
                style:
                    Theme.of(context).primaryTextTheme.displayMedium?.copyWith(
                          fontSize: 12,
                          color: theme.primaryTextColor,
                          decoration: TextDecoration.underline,
                        ),
              ),
            )
          ],
        ),
      ],
    );
  }

  @override
  FooterViewModel viewModelBuilder(BuildContext context) => FooterViewModel();

  @override
  void onViewModelReady(FooterViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
