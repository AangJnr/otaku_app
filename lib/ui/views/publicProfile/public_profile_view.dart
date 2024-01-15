import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/model/profile/profile.dart';
import 'public_profile_view.desktop.dart';
import 'public_profile_view.mobile.dart';
import 'public_profile_viewmodel.dart';

class PublicProfileView extends StackedView<PublicProfileViewModel> {
  final Profile? profile;
  const PublicProfileView({this.profile, super.key});

  @override
  Widget builder(
    BuildContext context,
    PublicProfileViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const PublicProfileViewMobile(),
      tablet: (_) => const PublicProfileViewDesktop(),
      desktop: (_) => const PublicProfileViewDesktop(),
    );
  }

  @override
  void onViewModelReady(PublicProfileViewModel viewModel) {
    viewModel.init(profile: profile);
    super.onViewModelReady(viewModel);
  }

  @override
  PublicProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PublicProfileViewModel();
}
