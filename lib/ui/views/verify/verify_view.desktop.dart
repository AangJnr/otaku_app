import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:otaku_katarougu_app/ui/common/app_constants.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/widgets/footer/footer_widget.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/banner/banner_widget.dart';
import 'verify_model.dart';

const radiusValue = 25.0;

class TermsAndPolicyDesktop extends ViewModelWidget<VerifyModel> {
  const TermsAndPolicyDesktop({super.key});

  @override
  Widget build(BuildContext context, VerifyModel viewModel) {
    final theme = viewModel.appTheme;
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              horizontalSpaceMedium,
              SideBannerImageWidget(),
              verticalSpaceLarge,
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
