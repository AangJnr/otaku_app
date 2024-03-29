import 'package:otaku_katarougu_app/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/loading.dart';
import 'package:otaku_katarougu_app/ui/widgets/topbar_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/utilities.dart';
import '../../widgets/footer/links_widget.dart';
import '../../widgets/logo_widget.dart';
import 'pager.dart';
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoWidget(
                    size: const Size(80, 80),
                    isLight: Utils.isColorLight(theme.panelBackgroundColor),
                  ),
                const  Expanded(child:  TopbarWidget())
                ],
              ),
              Expanded(
                child: Material(
                  shadowColor: Colors.black38,
                  elevation: 10,
                  borderRadius: borderRadius,
                  color: Colors.white,
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
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
                        Flexible(
                            child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 450,
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                          ),
                          child: viewModel.isBusy
                              ? const LoadingWidget()
                              : const CategoriesPagerWidget(),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Linkswidget(
                  showFooterLogo: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
