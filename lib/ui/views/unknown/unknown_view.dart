import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/app/services/screen_manager.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'unknown_view.desktop.dart';
import 'unknown_view.mobile.dart';
import 'unknown_viewmodel.dart';

class UnknownView extends StackedView<UnknownViewModel> {
  const UnknownView(
      {this.title = '404',
      this.pageRoute,
      this.message = 'PAGE NOT FOUND',
      super.key});
  final String? message;
  final String? title;
  final PageRouteInfo? pageRoute;
  @override
  Widget builder(
    BuildContext context,
    UnknownViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => UnknownViewMobile(
        title: title,
        message: message,
        pageRoute: pageRoute,
      ),
      desktop: (_) => UnknownViewDesktop(
        title: title,
        message: message,
        pageRoute: pageRoute,
      ),
    );
  }

  @override
  UnknownViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UnknownViewModel();
}
