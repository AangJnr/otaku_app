import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/views/base/view_state.dart';
import 'package:otaku_katarougu_app/ui/widgets/info_window.dart';

import '../../../config/theme_setup.dart';
import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/footer/footer_widget.dart';
import '../../widgets/social_buttons/social_buttons_widget.dart';
import 'public_profile_viewmodel.dart';

class PublicProfileWidget extends StatelessWidget {
  final PublicProfileViewModel viewModel;
  const PublicProfileWidget(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = viewModel.appTheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpaceMedium,
          ValueListenableBuilder<BaseViewState>(
              valueListenable: viewModel.viewStateNotifier,
              builder: (context, value, child) =>
                  _buidWidgetForStateChange(value, context, theme)),
          verticalSpaceLarge,
          const FooterWidget(),
          verticalSpaceLarge,
        ],
      ),
    );
  }

  Widget _buidWidgetForStateChange(
      BaseViewState state, BuildContext context, AppTheme theme) {
    switch (state) {
      case ProfileLoadedViewState():
        if (state.profile.isIncompleteProfile) {
          return InfoWindow(
            positiveAction: () {
              viewModel.goToLogin();
            },
            positiveText: 'Login to complete profile',
            buttonColor: viewModel.appTheme.accentColor,
            title1: 'Incomplete',
            title2: ' Profile!',
            message:
                'If you are the owner of this profile, Kindly complete your profile now to unlock a better user experience and personalized content. It\'s quick and easy – just a few clicks away!',
          );
        }
        return Column(children: [
          buildTitleAndRoleWidget(context, theme),
          verticalSpaceLarge,
          SizedBox(
            height: 400,
            width: 400,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(-0.6),
                    child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          color: theme.accentColor?.withOpacity(0.4),
                          borderRadius: AppConstants().borderRadius,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: AppConstants().borderRadius,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: viewModel.profile.picture.isEmpty
                        ? Image.asset(
                            'assets/logo/logo_dark.png',
                            height: 400,
                            width: 400,
                            fit: BoxFit.fitWidth,
                          )
                        : Image.network(
                            viewModel.profile.picture,
                            height: 400,
                            width: 400,
                            color: theme.accentColor?.withOpacity(0.5),
                            colorBlendMode: BlendMode.lighten,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceLarge,
          SocialButtons(viewModel.profile),
        ]);
      default:
        return const SizedBox.shrink();
    }
  }

  Column buildTitleAndRoleWidget(BuildContext context, AppTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${viewModel.profile.firstName}\n${viewModel.profile.lastName}",
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                color: theme.accentColor,
              ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: viewModel.profile.bio,
                style: Theme.of(context).primaryTextTheme.titleSmall?.copyWith(
                    color: theme.primaryTextColor?.withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '\n(2023 - present)',
                style: Theme.of(context).primaryTextTheme.titleSmall?.copyWith(
                    color: theme.primaryTextColor,
                    letterSpacing: 3,
                    fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
