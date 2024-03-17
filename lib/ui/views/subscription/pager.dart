import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otaku_katarougu_app/extensions/hover_extensions.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';

import 'subscription_model.dart';

class CategoriesPagerWidget extends ViewModelWidget<SubscriptionModel> {
  const CategoriesPagerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, SubscriptionModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.categories.length,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      controller:
          PageController(viewportFraction: 0.35, initialPage: viewModel.index),
      onPageChanged: viewModel.setIndex,
      itemBuilder: (_, i) {
        return Transform.scale(
          scale: i == viewModel.index ? 1 : 0.8,
          child: Opacity(
            opacity: i == viewModel.index ? 1 : 0.6,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  color: viewModel.categories[i].theme?.primaryBackgroundColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: viewModel.categories[i].theme?.accentColor,
                          ),
                          child: const FaIcon(
                            FontAwesomeIcons.qrcode,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              viewModel.categories[i].name,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: viewModel
                                      .categories[i].theme?.secondaryTextColor),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: viewModel.categories[i].currency,
                                    style: TextStyle(
                                        fontFeatures: const [
                                          FontFeature.superscripts(),
                                        ],
                                        fontWeight: FontWeight.w900,
                                        height: 1.4,
                                        color: viewModel.categories[i].theme
                                            ?.primaryTextColor,
                                        fontSize: 15),
                                  ),
                                  TextSpan(
                                    text: viewModel.categories[i].amount
                                        .toString(),
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          height: 1.4,
                                          color: viewModel
                                              .categories[i].theme?.accentColor,
                                          fontSize: 35,
                                        ),
                                  ),
                                  TextSpan(
                                    text:
                                        '  ${viewModel.categories[i].durationInDays.toYear()}',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w900,
                                          height: 1.4,
                                          color: viewModel.categories[i].theme
                                              ?.primaryTextColor,
                                          fontSize: 15,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  const Divider(),
                  Column(
                      children: viewModel.categories[i].features
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                FaIcon(
                                  FontAwesomeIcons.check,
                                  color: viewModel
                                      .categories[i].theme?.accentColor,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    e,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w900,
                                          height: 1.4,
                                          fontSize: 13,
                                          color: viewModel.categories[i].theme
                                              ?.primaryTextColor,
                                        ),
                                  ),
                                )
                              ]),
                            ),
                          )
                          .toList()),
                  verticalSpaceMedium,
                  PrimaryButtonWidget(
                    '  Choose Plan  ',
                    onTap: () {
                      viewModel.showEnterEmailToSubscribeDialog();
                    },
                    iconData: FontAwesomeIcons.arrowRight,
                    showText: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 25),
                    size: const Size(double.infinity, 60),
                    color: viewModel.categories[i].theme?.accentColor,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
