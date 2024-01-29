import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'subscription.desktop.dart';
import 'subscription.mobile.dart';
import 'subscription_model.dart';

enum Terms { terms, policy }

class SubscriptionView extends StackedView<SubscriptionModel> {
  const SubscriptionView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SubscriptionModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SubscriptionMobile(),
      desktop: (_) => const SubscriptionDesktop(),
      tablet: (_) => const SubscriptionDesktop(),
    );
  }

  @override
  SubscriptionModel viewModelBuilder(
    BuildContext context,
  ) =>
      SubscriptionModel();

  @override
  void onViewModelReady(SubscriptionModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
