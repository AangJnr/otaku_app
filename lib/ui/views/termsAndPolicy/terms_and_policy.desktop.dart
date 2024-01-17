import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:otaku_katarougu_app/ui/common/app_constants.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/banner/banner_widget.dart';
import '../../widgets/topbar_widget.dart';
import 'terms_and_policy_model.dart';

const radiusValue = 25.0;

class TermsAndPolicyDesktop extends ViewModelWidget<TermsAndPolicyModel> {
  const TermsAndPolicyDesktop({super.key});

  @override
  Widget build(BuildContext context, TermsAndPolicyModel viewModel) {
    final theme = viewModel.appTheme;
    final borderRadius = BorderRadius.circular(radiusValue);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              horizontalSpaceMedium,
              const Expanded(
                flex: 2,
                child: SideBannerImageWidget(),
              ),
              horizontalSpaceMedium,
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    TopbarWidget(
                      profile: viewModel.profile,
                      appTheme: viewModel.appTheme,
                    ),
                    verticalSpaceMedium,
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: theme.secondaryBackgroundColor),
                        child: SingleChildScrollView(
                            child: HtmlWidget(
                          viewModel.data,
                          textStyle: TextStyle(color: theme.primaryTextColor),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
