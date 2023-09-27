import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otaku_katarougu_app/ui/widgets/social_buttons/social_buttons_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/model/profile/profile.dart';
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
    return (viewModel.isWidgetVisible)
        ? Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildRowItem("WhatsApp",
                  style: style,
                  color: viewModel.appTheme.accentColor,
                  onTap: () =>
                      viewModel.launchWhatsApp(profile.socials.whatsapp),
                  iconData: FontAwesomeIcons.whatsapp,
                  textColor: viewModel.appTheme.primaryTextColor),
              _buildRowItem("Send an e-mail",
                  style: style,
                  color: viewModel.appTheme.accentColor,
                  onTap: () => viewModel.launchEmail(profile.email),
                  iconData: FontAwesomeIcons.envelope,
                  textColor: viewModel.appTheme.primaryTextColor),
              _buildRowItem("Call",
                  color: viewModel.appTheme.accentColor,
                  style: style,
                  onTap: () => viewModel.makePhoneCall(profile.phone),
                  iconData: FontAwesomeIcons.phone,
                  textColor: viewModel.appTheme.primaryTextColor),
              _buildRowItem("Facebook",
                  color: viewModel.appTheme.accentColor,
                  style: style,
                  onTap: () =>
                      viewModel.launchFacebook(profile.socials.facebook),
                  iconData: FontAwesomeIcons.facebook,
                  textColor: viewModel.appTheme.primaryTextColor),
              _buildRowItem("LinkedIn",
                  style: style,
                  color: viewModel.appTheme.accentColor,
                  onTap: () =>
                      viewModel.launchLinkedIn(profile.socials.linkedIn),
                  iconData: FontAwesomeIcons.linkedin,
                  textColor: viewModel.appTheme.primaryTextColor),
              _buildRowItem("Twitter",
                  style: style,
                  color: viewModel.appTheme.accentColor,
                  onTap: () => viewModel.launchWhatsApp(profile.phone),
                  iconData: FontAwesomeIcons.twitter,
                  textColor: viewModel.appTheme.primaryTextColor),
              _buildRowItem("Instagram",
                  style: style,
                  color: viewModel.appTheme.accentColor,
                  onTap: () => viewModel.launchWhatsApp(profile.phone),
                  iconData: FontAwesomeIcons.instagram,
                  textColor: viewModel.appTheme.primaryTextColor),
            ],
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: MaterialInkWell(
                onTap: viewModel.toggleVisibility,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                color: viewModel.appTheme.accentColor,
                child: Text(
                  'LET\'S CONNECT!',
                  style: style?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2),
                )),
          );
  }

  _buildRowItem(String label,
      {TextStyle? style,
      VoidCallback? onTap,
      IconData? iconData,
      Color? color,
      Color? textColor}) {
    return MaterialInkWell(
      onTap: onTap,
      splashColor: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      radiusValue: 20,
      color: Colors.white,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: color),
          padding: const EdgeInsets.all(5),
          child: FaIcon(
            iconData,
            color: Colors.white,
            size: 14,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(label, style: style?.copyWith(color: textColor))
      ]),
    );
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
