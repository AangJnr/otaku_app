import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/back_drop_filter_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../domain/model/dialog_data.dart';
import 'loading_alert_dialog_model.dart';

import '../../widgets/loading.dart';

const double _graphicSize = 60;

class LoadingAlertDialog extends StackedView<LoadingAlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LoadingAlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoadingAlertDialogModel viewModel,
    Widget? child,
  ) {
    final dialog = request.data! as DialogData;
    return BlurView(
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxHeight: 500, maxWidth: 600),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dialog.title,
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1.4,
                  color: Colors.black,
                  fontSize: 30),
            ),
            if (dialog.message.isNotEmpty) ...[
              verticalSpaceMedium,
              Text(
                dialog.title,
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.4,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ],
            verticalSpaceLarge,
            const LoadingWidget(),
            verticalSpaceLarge
          ],
        ),
      ),
    );
  }

  @override
  LoadingAlertDialogModel viewModelBuilder(BuildContext context) =>
      LoadingAlertDialogModel();
}
