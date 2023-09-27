import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otaku_katarougu_app/ui/common/app_constants.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../config/theme_setup.dart';
import 'terms_and_policy_model.dart';

const radiusValue = 25.0;
class TermsAndPolicyDesktop extends ViewModelWidget<TermsAndPolicyModel> {
  final AppTheme? appTheme;
  const TermsAndPolicyDesktop({this.appTheme, super.key});

  @override
  Widget build(BuildContext context, TermsAndPolicyModel viewModel) {
    final theme = appTheme ?? DefaultTheme();
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
              Expanded(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: theme.primaryBackgroundColor),
                  child: viewModel.hasImage
                      ? Image.asset(
                    viewModel.bannerImage,
                    fit: BoxFit.contain,
                  )
                      : const SizedBox.shrink(),
                ),
              ),
              horizontalSpaceMedium,
              Expanded(
                flex: 3,
                child: Container(
                  padding:const EdgeInsets.all(30),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      color: theme.secondaryBackgroundColor),
                  child: SingleChildScrollView(child: HtmlWidget(viewModel.data, textStyle: TextStyle(color: theme.primaryTextColor),)),
                ),
              ),
              horizontalSpaceMedium,
            ],
          ),
        ),
      ),
    );  }
}
