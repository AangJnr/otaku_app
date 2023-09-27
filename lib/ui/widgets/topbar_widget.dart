import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';
import '../../config/theme_setup.dart';
import '../../domain/model/profile/profile.dart';
import 'material_inkwell.dart';

class TopbarWidget extends StatelessWidget {
  final Profile? profile;
  final AppTheme? appTheme;
  final String? label;
  const TopbarWidget({this.profile, this.label, this.appTheme, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = this.appTheme ?? DefaultTheme();
    final headerTextStyle = Theme.of(context)
        .primaryTextTheme
        .titleSmall
        ?.copyWith(
            color: appTheme.primaryTextColor,
            fontSize: 13,
            fontWeight: FontWeight.w700);
    return Row(
      children: [
        if (profile != null)
          buildHeaderItem('PROFILE',
              onTap: () => locator<RouterService>()
                  .navigateTo(ProfileViewRoute(profile: profile)),
              style: headerTextStyle,
              isSelected: 'PROFILE' == label),
        buildHeaderItem('WORK',
            onTap: () => locator<RouterService>()
                .navigateTo(WorkViewRoute(profile: profile)),
            style: headerTextStyle,
            isSelected: 'WORK' == label),
        const Spacer(),
        buildHeaderItem('Share Profile', onTap: (){}, style: headerTextStyle),
        buildHeaderItem('Get a card',
            onTap: () => locator<RouterService>()
                .navigateTo(const SubscriptionViewRoute()),
            style: headerTextStyle),
        buildHeaderItem('Login',
            onTap: () => locator<RouterService>()
                .navigateTo(const SubscriptionViewRoute()),
            style: headerTextStyle),
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
