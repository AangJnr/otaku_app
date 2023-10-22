import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/main.dart';
import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/back_drop_filter_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
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
        child: _buildChildWidget(context, viewModel),
      ),
    );
  }

  @override
  LoginAlertDialogModel viewModelBuilder(BuildContext context) =>
      LoginAlertDialogModel();

  Widget _buildLoadingWidget(BuildContext context) {
    final theme = MainApp.appTheme;
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
        LoadingWidget(),
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

  Widget _buildSuccessMessage(
      BuildContext context, LoginAlertDialogModel viewModel) {
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
          viewModel.message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: kcMediumGrey),
          maxLines: 3,
          softWrap: true,
        ),
        verticalSpaceMedium,
      ],
    );
  }

  Widget _buildChildWidget(
      BuildContext context, LoginAlertDialogModel viewModel) {
    switch (viewModel.state) {
      case SubsState.loading:
        return _buildLoadingWidget(context);
      case SubsState.success:
        return _buildSuccessMessage(context, viewModel);
      case SubsState.failed:
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
                    viewModel.goToSubscriptionScreen();
                  }
                : null,
            positiveText: 'Subscribe!',
            buttonColor: viewModel.appTheme.accentColor);
      default:
        return _buildLoginWidget(context, viewModel);
    }
  }
}
