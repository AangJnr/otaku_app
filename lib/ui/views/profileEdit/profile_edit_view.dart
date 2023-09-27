import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

 import '../../../domain/model/profile/profile.dart';
import 'profile_edit_view.desktop.dart';
import 'profile_edit_view.mobile.dart';
import 'profile_edit_viewmodel.dart';

class ProfileEditView extends StackedView<ProfileEditViewModel> {
  final Profile?  profile;
  const ProfileEditView( {  this.profile,super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileEditViewModel viewModel,
    Widget? child,
  ) {

    viewModel.init(profile: profile);
    return ScreenTypeLayout.builder(
      mobile: (_) => const ProfileEditViewMobile(),
      tablet: (_) => const ProfileEditViewDesktop(),
      desktop: (_) => const ProfileEditViewDesktop(),
    );
  }

  @override
  void onViewModelReady(ProfileEditViewModel viewModel) {

viewModel.init();
super.onViewModelReady(viewModel);
  }

  @override
  ProfileEditViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileEditViewModel();


}


