import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/back_drop_filter_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../widgets/error_widget.dart';
import 'subscription_alert_dialog_model.dart';

import '../../../domain/model/category/category.dart';
import '../../widgets/labeled_form_field.dart';
import '../../widgets/loading.dart';

const double _graphicSize = 60;

class SubscriptionAlertDialog
    extends StackedView<SubscriptionAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const SubscriptionAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SubscriptionAlertDialogModel viewModel,
    Widget? child,
  ) {
    final category = request.data! as Category;
    return BlurView(
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxHeight: 500, maxWidth: 600),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: _buildChildWidget(context, viewModel, category),
      ),
    );
  }

  @override
  SubscriptionAlertDialogModel viewModelBuilder(BuildContext context) =>
      SubscriptionAlertDialogModel();

  Widget _buildLoadingWidget(BuildContext context, Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Subscribing. Please wait...',
          style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              height: 1.4,
              color: Colors.black,
              fontSize: 30),
        ),
        verticalSpaceLarge,
       const LoadingWidget(),
        verticalSpaceLarge
      ],
    );
  }

  Widget _buildSubscriptionWidget(BuildContext context,
      SubscriptionAlertDialogModel viewModel, Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpaceMedium,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Subscribe to\t',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.4,
                    color: Colors.black,
                    fontSize: 30),
              ),
              TextSpan(
                text: category.name,
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.4,
                      color: category.theme?.accentColor,
                      fontSize: 30,
                    ),
              ),
            ],
          ),
        ),
        verticalSpaceTiny,
        const Text(
          "Get access to features such as:",
          style: TextStyle(fontSize: 14, color: kcMediumGrey),
          maxLines: 3,
          softWrap: true,
        ),
        verticalSpaceSmall,
        Wrap(
          children: category.features
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      color: category.theme?.accentColor,
                      size: 25,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      e,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w900,
                            height: 1.4,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                    )
                  ]),
                ),
              )
              .toList(),
        ),
        verticalSpaceMedium,
        LabeledFormField(
          hint: 'Enter email',
          label: "Please enter your email to subscribe",
          accentColor: Colors.black87,
          onChanged: viewModel.updateEmail,
          initialValue: viewModel.email,
        ),
        verticalSpaceMedium,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButtonWidget(
              "Cancel",
              onTap: () => completer(DialogResponse(
                confirmed: false,
              )),
              showText: true,
              color: Colors.red[400],
            ),
            horizontalSpaceMedium,
            PrimaryButtonWidget(
              "Subscribe",
              onTap: viewModel.isEmailValid
                  ? () {
                      viewModel.subscribe(category);
                    }
                  : null,
              showText: true,
              color: category.theme?.accentColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThankYouWidget(BuildContext context,
      SubscriptionAlertDialogModel viewModel, Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpaceMedium,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'We appreciate your\t',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.4,
                    color: Colors.black,
                    fontSize: 30),
              ),
              TextSpan(
                text: 'Subscription!',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.4,
                      color: category.theme?.accentColor,
                      fontSize: 30,
                    ),
              ),
            ],
          ),
        ),
        verticalSpaceLarge,
        const Text(
          "An email has been sent to your inbox confirming your subscription. Click on the button below to go to your profile!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: kcMediumGrey),
          maxLines: 3,
          softWrap: true,
        ),
        verticalSpaceMedium,
        PrimaryButtonWidget(
          "Go to Profile",
          onTap: viewModel.isEmailValid
              ? () {
                  viewModel.goToProfile();
                }
              : null,
          showText: true,
          color: category.theme?.accentColor,
        ),
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context,
      SubscriptionAlertDialogModel viewModel, Category category) {
    return AErrorWidget(
      message: viewModel.modelError,
      negativeAction: () => completer(
        DialogResponse(
          confirmed: false,
        ),
      ),
      negativeText: 'Cancel',
      positiveAction: viewModel.isEmailValid
          ? () {
              viewModel.subscribe(category);
            }
          : null,
      positiveText: 'Try again',
      buttonColor: viewModel.appTheme.accentColor,
      child: GestureDetector(
        onTap: () {
          completer(DialogResponse(
            confirmed: false,
          ));
          viewModel.goToLogin();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Login",
            style: Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                decoration: TextDecoration.underline,
                color: viewModel.appTheme.accentColor),
          ),
        ),
      ),
    );
  }

  Widget _buildChildWidget(BuildContext context,
      SubscriptionAlertDialogModel viewModel, Category category) {
    switch (viewModel.subscriptionState) {
      case SubsState.loading:
        return _buildLoadingWidget(context, category);
      case SubsState.subscribed:
        return _buildThankYouWidget(context, viewModel, category);
      case SubsState.failed:
        return _buildErrorWidget(context, viewModel, category);
      default:
        return _buildSubscriptionWidget(context, viewModel, category);
    }
  }
}
