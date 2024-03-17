import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'verify_view.desktop.dart';
import 'verify_view.mobile.dart';
import 'verify_model.dart';

enum TermsView { terms, policy }

class TermsAndPolicyView extends StackedView<VerifyModel> {
  const TermsAndPolicyView({super.key});

  @override
  Widget builder(
    BuildContext context,
    VerifyModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TermsAndPolicyMobile(),
      desktop: (_) => const TermsAndPolicyDesktop(),
      tablet: (_) => const TermsAndPolicyDesktop(),
    );
  }

  @override
  VerifyModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyModel();

  @override
  void onViewModelReady(VerifyModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}
