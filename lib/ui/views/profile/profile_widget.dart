import 'package:flutter/material.dart';

import '../../../config/theme_setup.dart';
import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/footer/footer_widget.dart';
import '../../widgets/social_buttons/social_buttons_widget.dart';
import 'profile_viewmodel.dart';

class ProfileWidget extends StatelessWidget {
  final ProfileViewModel viewModel;
  const ProfileWidget(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = viewModel.appTheme;
    final borderRadius = BorderRadius.circular(radiusValue);

    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpaceMedium,
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
                          borderRadius: borderRadius,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
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
          verticalSpaceLarge,
          const FooterWidget(),
          verticalSpaceLarge,
        ],
      ),
    );
  }

  Column buildTitleAndRoleWidget(BuildContext context, AppTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${viewModel.profile.firstName}\n${viewModel.profile.lastName}",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .primaryTextTheme
              .titleLarge
              ?.copyWith(color: theme.primaryTextColor),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text:viewModel.profile.bio  ,
                style: Theme.of(context).primaryTextTheme.titleSmall?.copyWith(
                    color: theme.primaryTextColor?.withOpacity(0.9), fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '\n(2023 - present)',
                style: Theme.of(context).primaryTextTheme.titleSmall?.copyWith(
                    color: theme.primaryTextColor,
                    letterSpacing: 3,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
