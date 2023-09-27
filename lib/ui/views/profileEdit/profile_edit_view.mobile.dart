import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_edit_viewmodel.dart';

class ProfileEditViewMobile extends ViewModelWidget<ProfileEditViewModel> {
  const ProfileEditViewMobile({super.key});

  @override
  Widget build(BuildContext context, ProfileEditViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(

          ),
        ),
      ),
    );
  }
}
