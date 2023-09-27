import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/model/profile/profile.dart';
import 'profile_view.desktop.dart';
import 'profile_view.mobile.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  final Profile? profile;
  const ProfileView({this.profile, super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const ProfileViewMobile(),
      tablet: (_) => const ProfileViewDesktop(),
      desktop: (_) => const ProfileViewDesktop(),
    );
  }

  @override
  void onViewModelReady(ProfileViewModel viewModel) {
    viewModel.init(profile: profile);
    super.onViewModelReady(viewModel);
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
