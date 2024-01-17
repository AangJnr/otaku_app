import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/services/screen_manager.dart';
import 'package:otaku_katarougu_app/main.dart';
import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/back_drop_filter_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../views/base/view_state.dart';
import '../../widgets/circle_butto_widget.dart';
import '../../widgets/error_widget.dart';
import 'login_alert_dialog_model.dart';

import '../../widgets/labeled_form_field.dart';
import '../../widgets/loading.dart';

class LoginAlertDialog extends StackedView<LoginAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LoginAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginAlertDialogModel viewModel,
    Widget? child,
  ) {
    return BlurView(
      child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxHeight: 500, maxWidth: 600),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: ValueListenableBuilder<BaseViewState>(
            valueListenable: viewModel.viewStateNotifier,
            builder: (context, state, child) {
              switch (state) {
                case LoadingViewState():
                  return _buildLoadingWidget(context);
                case VerificationLinkSentViewState():
                  return _buildSuccessMessage(context, state.message);
                case ErrorViewState():
                  return AErrorWidget(
                      message: state.errorMessage,
                      negativeAction: () => completer(
                            DialogResponse(
                              confirmed: false,
                            ),
                          ),
                      negativeText: 'Cancel',
                      buttonColor: viewModel.appTheme.accentColor);
                default:
                  return _buildLoginWidget(context, viewModel);
              }
            },
          )),
    );
  }

  @override
  LoginAlertDialogModel viewModelBuilder(BuildContext context) =>
      LoginAlertDialogModel();

  Widget _buildLoadingWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Logging in. Please wait...',
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

  Widget _buildLoginWidget(
      BuildContext context, LoginAlertDialogModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpaceMedium,
        Text(
          'Login',
          style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              height: 1.4,
              color: Colors.black,
              fontSize: 30),
        ),
        verticalSpaceLarge,
        const Text(
          "A verification link will be sent to your email address to verify your account.",
          style: TextStyle(fontSize: 14, color: kcMediumGrey),
          maxLines: 3,
          softWrap: true,
        ),
        verticalSpaceMedium,
        LabeledFormField(
          hint: '',
          label: "Please enter your email to login",
          accentColor: Colors.black87,
          onChanged: viewModel.updateEmail,
          initialValue: viewModel.email,
        ),
        verticalSpaceMedium,
        const Text(
          "OR",
          style: TextStyle(fontSize: 20, color: kcBlack),
        ),
        verticalSpaceMedium,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleIconButtonWidget(
              onTap: viewModel.performGoogleSignIn,
              assetUrl: 'assets/icons/google_coloured.png',
              textColor: viewModel.appTheme.primaryTextColor,
            ),
          ],
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
              "Send Verification Link",
              onTap: viewModel.isEmailValid
                  ? () {
                      viewModel.login();
                    }
                  : null,
              showText: true,
              color: MainApp.appTheme.accentColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSuccessMessage(BuildContext context, String message) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpaceMedium,
          Text(
            'Success!',
            style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                height: 1.4,
                color: Colors.black,
                fontSize: 30),
          ),
          verticalSpaceLarge,
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: kcMediumGrey),
            softWrap: true,
          ),
          verticalSpaceMedium,
          PrimaryButtonWidget(
            "Back To Home",
            onTap: () => locator<ScreenManagerService>()
                .goToSubscriptionScreen(shouldReplace: true),
            showText: true,
            color: MainApp.appTheme.accentColor,
          ),
        ]);
  }
}
