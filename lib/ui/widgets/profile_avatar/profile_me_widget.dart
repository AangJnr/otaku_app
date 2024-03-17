import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'profile_image_view_model.dart';
import 'profile_me_widget.desktop.dart';
import 'profile_me_widget.mobile.dart';

class ProfileMeWidget extends StackedView<ProfileImageViewModel> {
  final bool isLoading;
  final bool showNameDetails;
  final double size;
  const ProfileMeWidget({
    this.isLoading = false,
    this.showNameDetails = true,
    super.key,
    this.size = 64,
  });

  @override
  Widget builder(
      BuildContext context, ProfileImageViewModel viewModel, Widget? child) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const ProfileAvatarWidgetMobile(),
        tablet: (_) => const ProfileAvatarWidgetDesktop(),
        desktop: (_) => const ProfileAvatarWidgetDesktop());
  }

  @override
  ProfileImageViewModel viewModelBuilder(BuildContext context) =>
      ProfileImageViewModel();
}
