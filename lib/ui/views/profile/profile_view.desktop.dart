import 'package:otaku_katarougu_app/ui/common/app_constants.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/views/profile/profile_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/loading.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/material_inkwell.dart';
import '../../widgets/topbar_widget.dart';
import 'profile_viewmodel.dart';

class ProfileViewDesktop extends ViewModelWidget<ProfileViewModel> {
  const ProfileViewDesktop({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    final theme = viewModel.appTheme;

    return Scaffold(
      backgroundColor: theme.panelBackgroundColor,
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Material(
                  shadowColor: Colors.black26,
                  elevation: 0,
                  color: Colors.transparent,
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: viewModel.hasImage
                        ? Image.asset(
                            viewModel.bannerImage,
                            fit: BoxFit.contain,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
              horizontalSpaceLarge,
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Material(
                    shadowColor: Colors.black26,
                    elevation: 0,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(radiusValue),
                      topRight: Radius.circular(radiusValue),
                    ),
                    color: theme.primaryBackgroundColor,
                    child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Column(
                          children: [
                            TopbarWidget(
                              profile: viewModel.profile,
                              label: 'PROFILE', appTheme: viewModel.appTheme,
                            ), verticalSpaceMedium,
                            if (viewModel.isBusy)
                              const LoadingWidget()
                            else
                              Expanded(child: ProfileWidget(viewModel)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpaceMedium,
            ],
          ),
        ),
      ),
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
