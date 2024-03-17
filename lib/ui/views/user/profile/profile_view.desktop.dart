import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otaku_katarougu_app/config/theme_setup.dart';
import 'package:otaku_katarougu_app/extensions/num_extensions.dart';
import 'package:otaku_katarougu_app/ui/common/app_constants.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/widgets/banner/banner_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/loading.dart';
import 'package:otaku_katarougu_app/ui/widgets/logo_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/profile_avatar/profile_me_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/material_inkwell.dart';
import '../../../widgets/topbar_widget.dart';
import '../../base/view_state.dart';
import 'profile_viewmodel.dart';
import 'profile_widget.dart';

class MyProfileViewDesktop extends ViewModelWidget<MyProfileViewModel> {
  const MyProfileViewDesktop({super.key});

  @override
  Widget build(BuildContext context, MyProfileViewModel viewModel) {
    return Scaffold(
      backgroundColor: viewModel.appTheme.primaryBackgroundColor,
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: _buildLeftSideWidget(viewModel),
              ),
              horizontalSpaceLarge,
              Expanded(
                flex: 5,
                child: _buildRightSideWidget(viewModel),
              ),
              horizontalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRightSideWidget(MyProfileViewModel viewModel) {
    final theme = viewModel.appTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Material(
        shadowColor: Colors.black26,
        elevation: 0,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(radiusValue),
          topRight: Radius.circular(radiusValue),
        ),
        color: theme.panelBackgroundColor,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                TopbarWidget(
                  profile: viewModel.profile,
                  label: 'PROFILE',
                  appTheme: viewModel.appTheme,
                ),
                verticalSpaceMedium,
                Expanded(child: MyProfileWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftSideWidget(MyProfileViewModel viewModel) {
    return ValueListenableBuilder<BaseViewState>(
      valueListenable: viewModel.viewStateNotifier,
      builder: (context, state, child) {
        switch (state) {
          case NoProfilesViewState():
            return const SideBannerImageWidget();

          default:
            return Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
              child: Column(children: [
                LogoWidget(size: Size(80, 80)),
                verticalSpaceLarge,
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(10)),
                    child: viewModel.profile.picture.isEmpty
                        ? Image.asset(
                            'assets/logo/logo_dark.png',
                            height: 120,
                            width: 120,
                            fit: BoxFit.fitWidth,
                          )
                        : Image.network(
                            viewModel.profile.picture,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          )),
                verticalSpaceMedium,
                buildTitleAndRoleWidget(context, viewModel)
              ]),
            );
        }
      },
    );
  }

  Column buildTitleAndRoleWidget(
      BuildContext context, MyProfileViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (viewModel.profile.fullName.isNotEmpty)
          Text(
            viewModel.profile.fullName,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .primaryTextTheme
                .titleLarge
                ?.copyWith(color: viewModel.appTheme.accentColor, fontSize: 25),
          ),
        Text(
          '@${viewModel.user.userName}',
          textAlign: TextAlign.justify,
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: viewModel.appTheme.primaryTextColor?.withOpacity(0.9),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
        verticalSpaceSmall,
        Container(
          height: 3,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.black87, borderRadius: BorderRadius.circular(10)),
        ),
        verticalSpaceMedium,
        if (viewModel.profile.bio.isNotEmpty)
          Text(
            viewModel.profile.bio,
            textAlign: TextAlign.justify,
            // overflow: TextOverflow.ellipsis,
            style: Theme.of(context).primaryTextTheme.titleSmall?.copyWith(
                color: viewModel.appTheme.primaryTextColor, fontSize: 13),
          ),
        verticalSpaceLarge,
        _buildStatsWidget(viewModel)
      ],
    );
  }

  Widget _buildStatsWidget(MyProfileViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildStatsItem(
              'Visits',
              viewModel.user.totalVisitCounts,
              FontAwesomeIcons.peopleGroup,
              viewModel.appTheme.primaryBackgroundColor,
              viewModel.appTheme.primaryTextColor),
        ),
        horizontalSpaceMedium,
        Expanded(
          child: _buildStatsItem(
              'Saved',
              32000.toImperial(),
              FontAwesomeIcons.solidAddressCard,
              viewModel.appTheme.primaryBackgroundColor,
              viewModel.appTheme.primaryTextColor),
        )
      ],
    );
  }

  Widget _buildStatsItem(
    String label,
    String value,
    IconData icon,
    Color? color,
    Color? textColor,
  ) {
    final style = GoogleFonts.robotoFlex();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  icon,
                  size: 15,
                  color: textColor,
                ),
                horizontalSpaceTiny,
                Text(
                  value,
                  style: style.copyWith(
                      color: textColor,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
             Text(
              label,
              style:   TextStyle(fontSize: 11, color: textColor),
            )
          ]),
    );
  }
}
