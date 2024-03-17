import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'terms_and_policy.desktop.dart';
import 'terms_and_policy.mobile.dart';
import 'terms_and_policy_model.dart';

enum TermsView { terms, policy }

class TermsAndPolicyView extends StackedView<TermsAndPolicyModel> {
  const TermsAndPolicyView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TermsAndPolicyModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TermsAndPolicyMobile(),
      desktop: (_) => const TermsAndPolicyDesktop(),
      tablet: (_) => const TermsAndPolicyDesktop(),
    );
  }

  @override
  TermsAndPolicyModel viewModelBuilder(
    BuildContext context,
  ) =>
      TermsAndPolicyModel();

  @override
  void onViewModelReady(TermsAndPolicyModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
