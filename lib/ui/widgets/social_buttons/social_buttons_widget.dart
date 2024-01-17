import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otaku_katarougu_app/ui/views/base/viewmodel.dart';
import 'package:otaku_katarougu_app/ui/widgets/social_buttons/social_buttons_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/model/profile/profile.dart';
import '../circle_butto_widget.dart';
import '../material_inkwell.dart';

class SocialButtons extends StackedView<SocialButtonsViewModel> {
  final Profile profile;
  const SocialButtons(this.profile, {super.key});

  @override
  Widget builder(
      BuildContext context, SocialButtonsViewModel viewModel, Widget? child) {
    final style = Theme.of(context).primaryTextTheme.titleSmall?.copyWith(
        color: viewModel.appTheme.primaryTextColor,
        fontSize: 13,
        fontWeight: FontWeight.w400);
    return ResponsiveBuilder(
        builder: (c, s) => Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                if (profile.socials.whatsapp.isNotEmpty)
                  CircleIconButtonWidget(
                    label: "WhatsApp",
                    style: style,
                    color: viewModel.appTheme.tertiaryBackgroundColor,
                    onTap: () => viewModel.launchSocialLink(Social.WhatsApp,
                        profile.socials.whatsapp.replaceFirst('+', '')),
                    iconData: FontAwesomeIcons.whatsapp,
                    assetUrl: 'assets/icons/whatsapp.png',
                    textColor: viewModel.appTheme.primaryTextColor,
                  ),
                if (profile.email.isNotEmpty)
                  CircleIconButtonWidget(
                    label: "Send an e-mail",
                    style: style,
                    color: viewModel.appTheme.tertiaryBackgroundColor,
                    onTap: () => viewModel.launchEmail(profile.email),
                    assetUrl: 'assets/icons/gmail.png',
                    iconData: FontAwesomeIcons.envelope,
                    textColor: viewModel.appTheme.primaryTextColor,
                  ),
                if (profile.phone.isNotEmpty)
                  CircleIconButtonWidget(
                    label: "Call",
                    style: style,
                    color: viewModel.appTheme.tertiaryBackgroundColor,
                    onTap: () => viewModel.makePhoneCall(profile.phone),
                    iconData: FontAwesomeIcons.phone,
                    assetUrl: 'assets/icons/phone.png',
                    textColor: viewModel.appTheme.primaryTextColor,
                  ),
                if (profile.socials.facebook.isNotEmpty)
                  CircleIconButtonWidget(
                    label: "Facebook",
                    color: viewModel.appTheme.tertiaryBackgroundColor,
                    style: style,
                    onTap: () => viewModel.launchSocialLink(
                        Social.Facebook, profile.socials.facebook),
                    iconData: FontAwesomeIcons.facebook,
                    textColor: viewModel.appTheme.primaryTextColor,
                    assetUrl: 'assets/icons/facebook.png',
                  ),
                if (profile.socials.linkedIn.isNotEmpty)
                  CircleIconButtonWidget(
                    label: "LinkedIn",
                    style: style,
                    color: viewModel.appTheme.tertiaryBackgroundColor,
                    onTap: () => viewModel.launchSocialLink(
                        Social.LinkedIn, profile.socials.linkedIn),
                    iconData: FontAwesomeIcons.linkedin,
                    assetUrl: 'assets/icons/linkedin.png',
                    textColor: viewModel.appTheme.primaryTextColor,
                  ),
                if (profile.socials.twitter.isNotEmpty)
                  CircleIconButtonWidget(
                    label: "Twitter",
                    style: style,
                    color: viewModel.appTheme.tertiaryBackgroundColor,
                    onTap: () => viewModel.launchSocialLink(
                        Social.Twitter, profile.phone),
                    iconData: FontAwesomeIcons.twitter,
                    assetUrl: 'assets/icons/twitter.png',
                    textColor: viewModel.appTheme.primaryTextColor,
                  ),
                if (profile.socials.instagram.isNotEmpty)
                  CircleIconButtonWidget(
                    label: "Instagram",
                    style: style,
                    onTap: () => viewModel.launchSocialLink(
                        Social.Twitter, profile.phone),
                    iconData: FontAwesomeIcons.instagram,
                    assetUrl: 'assets/icons/instagram.png',
                    color: viewModel.appTheme.tertiaryBackgroundColor,
                    textColor: viewModel.appTheme.primaryTextColor,
                  ),
              ],
            ));

    // : ClipRRect(
    //     borderRadius: BorderRadius.circular(20),
    //     child: MaterialInkWell(
    //         onTap: viewModel.toggleVisibility,
    //         padding:
    //             const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    //         color: viewModel.appTheme.accentColor,
    //         child: Text(
    //           'LET\'S CONNECT!',
    //           style: style?.copyWith(
    //               fontWeight: FontWeight.w900,
    //               color: Colors.white,
    //               letterSpacing: 2),
    //         )),
    //   );
  }

  @override
  void onViewModelReady(SocialButtonsViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  SocialButtonsViewModel viewModelBuilder(BuildContext context) {
    return SocialButtonsViewModel();
  }
}
