// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/subscription_alert/subscription_alert_dialog.dart';

enum DialogType {
  subscriptionAlert,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();
  final Map<DialogType, DialogBuilder> builders = {
    DialogType.subscriptionAlert: (context, request, completer) =>
        SubscriptionAlertDialog(request: request, completer: completer),
  };
  dialogService.registerCustomDialogBuilders(builders);
}
