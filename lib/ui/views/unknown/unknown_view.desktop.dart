import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../viewmodel.dart';
import 'unknown_viewmodel.dart';

class UnknownViewDesktop extends ViewModelWidget<UnknownViewModel> {
  final String? message;
  final String? title;
  final PageRouteInfo? pageRoute;

  const UnknownViewDesktop(
      {this.title,
      this.pageRoute,
      this.message ,
      super.key});

  @override
  Widget build(BuildContext context, UnknownViewModel viewModel) {
    return Scaffold(
      backgroundColor: viewModel.appTheme.primaryBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              style: TextStyle(
                color: viewModel.appTheme.primaryTextColor,
                fontSize: 80,
                fontWeight: FontWeight.w800,
                height: 0.95,
                letterSpacing: 20.0,
              ),
            ),
            verticalSpaceSmall,
            Text(
              message!, textAlign: TextAlign.center,
              style: TextStyle(
                color: viewModel.appTheme.primaryTextColor?.withOpacity(0.7),
                fontSize: 20,
                letterSpacing: 20.0,
                wordSpacing: 10.0,
              ),
            ),
            verticalSpaceMedium,
            if (pageRoute != null)
              PrimaryButtonWidget(
                "Refresh", color: viewModel.appTheme.accentColor,
                onTap: () {
                  viewModel.routerService.replaceWith(pageRoute!);
                },
                showText: true,
              )
          ],
        ),
      ),
    );
  }
}
