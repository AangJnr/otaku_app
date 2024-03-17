import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/services/screen_manager.dart';
import 'package:otaku_katarougu_app/app/services/social_auth_service.dart';
import 'package:otaku_katarougu_app/domain/repository/auth_repository.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.dialogs.dart';
import '../../config/theme_setup.dart';
import '../../domain/model/profile/profile.dart';
import 'material_inkwell.dart';
import 'profile_avatar/profile_me_widget.dart';

enum HeaderItem { profile, work }

class TopbarWidget extends StatelessWidget {
  final Profile? profile;
  final AppTheme? appTheme;
  final String? label;
  const TopbarWidget({this.profile, this.label, this.appTheme, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = this.appTheme ?? SilverTheme();
    final headerTextStyle = Theme.of(context)
        .primaryTextTheme
        .titleSmall
        ?.copyWith(
            color: appTheme.primaryTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w700);
    return Row(
      children: [
        if (profile != null) ...[
          buildHeaderItem('PROFILE',
              onTap: () => locator<ScreenManagerService>()
                  .goToPublicProfileScreen(profile, key: profile?.uid),
              style: headerTextStyle,
              isSelected: 'PROFILE' == label),
          buildHeaderItem('WORK',
              onTap: () => locator<ScreenManagerService>()
                  .goToPublicWorkAndExperiecesScreen(profile),
              style: headerTextStyle,
              isSelected: 'WORK' == label),
        ],
        const Spacer(),
        buildHeaderItem('Get a card',
            onTap: () =>
                locator<ScreenManagerService>().goToSubscriptionScreen(),
            style: headerTextStyle),
        FutureBuilder(
            future: locator<SocialAuthService>().isSignedIn(),
            builder: (ctx, snapshot) {
              if (snapshot.data ?? false) {
                return Row(
                  children: [
                    buildHeaderItem('Logout', onTap: () async {
                      await locator<SocialAuthService>().logout();
                      await locator<AuthRepository>().logout();
                      locator<ScreenManagerService>()
                          .goToSubscriptionScreen(shouldReplace: true);
                    }, style: headerTextStyle),
                    const ProfileMeWidget(),
                  ],
                );
              }
              return buildHeaderItem('Login', onTap: () async {
                locator<DialogService>()
                    .showCustomDialog(variant: DialogType.loginAlert);
              }, style: headerTextStyle);
            }),
      ],
    );
  }

  Widget buildHeaderItem(label,
      {TextStyle? style, VoidCallback? onTap, bool isSelected = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialInkWell(
        splashColor: Colors.grey[300],
        onTap: onTap,
        child: SizedBox(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: Column(
                children: [
                  Text(
                    label,
                    style: style,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    height: 2,
                    width: 30,
                    color: (isSelected) ? Colors.black87 : Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
