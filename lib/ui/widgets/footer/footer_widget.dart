import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';
import 'footer_viewmodel.dart';
import 'links_widget.dart';

class FooterWidget extends StackedView<FooterViewModel> {
  const FooterWidget({super.key});

  @override
  Widget builder(
      BuildContext context, FooterViewModel viewModel, Widget? child) {
    final theme = viewModel.appTheme;
    final borderRadius = BorderRadius.circular(radiusValue);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: theme.secondaryBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Text(
            'Unlock Your Digital Identity.\nGet Your Engraved NFC Business Card Now!',
            style: Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
                  color: theme.primaryTextColor,
                  fontWeight: FontWeight.w900,
                ),
          ),
          verticalSpaceSmall,
          GestureDetector(
            onTap: viewModel.goToSubscriptionScreen,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Get a card",
                style: Theme.of(context)
                    .primaryTextTheme
                    .displaySmall
                    ?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: theme.accentColor),
              ),
            ),
          ),
          const Linkswidget(),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(FooterViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  FooterViewModel viewModelBuilder(BuildContext context) {
    return FooterViewModel();
  }
}
