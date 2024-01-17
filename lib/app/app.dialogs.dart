// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/alert/alert_dialog.dart';
import '../ui/dialogs/loading_alert_dialog/loading_alert_dialog.dart';
import '../ui/dialogs/login_alert/login_alert_dialog.dart';
import '../ui/dialogs/subscription_alert/subscription_alert_dialog.dart';

enum DialogType {
  subscriptionAlert,
  loginAlert,
  alert,
  loadingAlert,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.subscriptionAlert: (context, request, completer) =>
        SubscriptionAlertDialog(request: request, completer: completer),
    DialogType.loginAlert: (context, request, completer) =>
        LoginAlertDialog(request: request, completer: completer),
    DialogType.alert: (context, request, completer) =>
        AlertDialog(request: request, completer: completer),
    DialogType.loadingAlert: (context, request, completer) =>
        LoadingAlertDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
