 import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/primary_button_widget.dart';
 import 'unknown_viewmodel.dart';

class UnknownViewMobile extends ViewModelWidget<UnknownViewModel> {
  final String? message;
  final String? title;
  final PageRouteInfo? pageRoute;

  const UnknownViewMobile(
      {this.title ,
        this.pageRoute,
        this.message ,
        super.key});
  @override
  Widget build(BuildContext context, UnknownViewModel viewModel) {
    return   Scaffold(
      backgroundColor:  viewModel.appTheme.primaryBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              style:   TextStyle(
                color:viewModel.appTheme.primaryTextColor,
                fontSize: 80,
                fontWeight: FontWeight.w800,
                height: 0.95,
                letterSpacing: 20.0,
              ),
            ),
            verticalSpaceSmall,
            Text(
              message!,textAlign: TextAlign.center,
              style:   TextStyle(
                color:viewModel.appTheme.primaryTextColor?.withOpacity(0.7),
                fontSize: 20,
                letterSpacing: 20.0,
                wordSpacing: 10.0,
              ),
            ), verticalSpaceSmall,
            if (pageRoute != null)
              PrimaryButtonWidget(
                "Refresh", color: viewModel.appTheme.accentColor,
                onTap: () {
                  viewModel.screenManager.goTo(pageRoute!);
                },
                showText: true,
              )
          ],
        ),
      ),
    );
  }
}
