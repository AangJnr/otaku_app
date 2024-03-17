import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/dialogs/login_alert/login_alert_dialog_model.dart';
import 'package:otaku_katarougu_app/ui/views/base/view_state.dart';
import 'package:otaku_katarougu_app/ui/widgets/info_window.dart';
import 'package:stacked/stacked.dart';

import '../../../../config/theme_setup.dart';
import '../../../common/app_constants.dart';
import '../../../common/ui_helpers.dart';
import '../../../widgets/footer/footer_widget.dart';
import '../../../widgets/loading.dart';
import 'profile_viewmodel.dart';

class MyProfileWidget extends ViewModelWidget<MyProfileViewModel> {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context, MyProfileViewModel viewModel) {
    final theme = viewModel.appTheme;

    return ValueListenableBuilder<BaseViewState>(
        valueListenable: viewModel.viewStateNotifier,
        builder: (context, state, child) =>
            _buidWidgetForStateChange(viewModel, state, context, theme));
  }

  Widget _buidWidgetForStateChange(MyProfileViewModel viewModel,
      BaseViewState state, BuildContext context, AppTheme theme) {
    switch (state) {
      case LoadingViewState():
        return const LoadingWidget();
      case NoProfilesViewState():
        return Column(
          children: [
            InfoWindow(
              positiveAction: () {
                viewModel.setEditProfileState();
              },
              positiveText: 'Add a Profile',
              buttonColor: viewModel.appTheme.accentColor,
              title1: 'No Profiles',
              title2: 'Available!',
              message:
                  'Kindly add a profile now to unlock a better user experience and personalized content. It\'s quick and easy – just a few clicks away!',
            ),
            const Spacer(),
            const FooterWidget(),
            verticalSpaceMedium
          ],
        );
      case MyProfilesLoadedViewState():
        return SingleChildScrollView(
          child: Column(children: []),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
