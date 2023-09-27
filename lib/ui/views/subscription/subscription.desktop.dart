 import 'package:otaku_katarougu_app/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/loading.dart';
import 'package:stacked/stacked.dart';
 import '../../widgets/footer/links_widget.dart';
import '../../widgets/logo_widget.dart';
import '../../widgets/pager.dart';
import 'subscription_model.dart';

const radiusValue = 25.0;

class SubscriptionDesktop extends ViewModelWidget<SubscriptionModel> {
  const SubscriptionDesktop({super.key});

  @override
  Widget build(BuildContext context, SubscriptionModel viewModel) {
    final theme = viewModel.appTheme;
    final borderRadius = BorderRadius.circular(radiusValue);
    return Scaffold(
      backgroundColor: theme.primaryBackgroundColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: getResponsiveHorizontalSpaceSmall(context)),
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(
                size: Size(80, 80),
                //isLight: Utils.isColorLight(theme.panelBackgroundColor),
              ),
              Expanded(
                child: Material(
                  shadowColor: Colors.black38,
                  elevation: 10,
                  borderRadius: borderRadius,
                  color:  Colors.white,
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Flexible\t',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        height: 1.4,
                                        color: theme.primaryTextColor,
                                        fontSize: 40),
                              ),
                              TextSpan(
                                text: 'Plans',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      height: 1.4,
                                      color: theme.accentColor,
                                      fontSize: 40,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceSmall,
                        Text(
                          'Choose a plan that works\nbest for you',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .displayMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: theme.secondaryTextColor,
                              ),
                        ),
                        verticalSpaceMedium,
                        Flexible(
                            child: Container(
                          constraints: const BoxConstraints(maxHeight: 450),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                          ),
                          child: viewModel.isBusy
                              ? LoadingWidget(
                                 pathBackgroundColor: viewModel
                                    .appTheme.primaryBackgroundColor,
                                colors: [viewModel.appTheme.accentColor!],
                              )
                              : const CategoriesPagerWidget(),
                        )),

                      ],
                    ),
                  ),
                ),
              ),verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Linkswidget(
                   showFooterLogo: false,
                ),
              )],
          ),
        ),
      ),
    );
  }
}
