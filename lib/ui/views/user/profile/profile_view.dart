import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../../domain/model/profile/profile.dart';
import 'profile_view.desktop.dart';
import 'profile_view.mobile.dart';
import 'profile_viewmodel.dart';

class MyProfileView extends StackedView<MyProfileViewModel> {
  final Profile? profile;
  const MyProfileView({this.profile, super.key});

  @override
  Widget builder(
    BuildContext context,
    MyProfileViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const MyProfileViewMobile(),
      tablet: (_) => const MyProfileViewDesktop(),
      desktop: (_) => const MyProfileViewDesktop(),
    );
  }

  @override
  void onViewModelReady(MyProfileViewModel viewModel) {
    viewModel.init(profile: profile);
    super.onViewModelReady(viewModel);
  }

  @override
  MyProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyProfileViewModel();
}
