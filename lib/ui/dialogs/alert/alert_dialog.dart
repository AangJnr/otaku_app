import 'package:flutter/material.dart';
 import 'package:otaku_katarougu_app/domain/model/dialog_data.dart';
import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/back_drop_filter_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'alert_dialog_model.dart';

 
class AlertDialog extends StackedView<AlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AlertDialogModel viewModel,
    Widget? child,
  ) {
    final data = request.data! as DialogData;
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
              verticalSpaceMedium,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Oops! Somethig happened :(',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                              fontWeight: FontWeight.w900,
                              height: 1.4,
                              color: Colors.black,
                              fontSize: 30),
                    ),
                    TextSpan(
                      text: data.message,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w900,
                            height: 1.4,
                            color: viewModel.appTheme.accentColor,
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
              verticalSpaceMedium,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButtonWidget(
                    "Back",
                    onTap: () {
                      completer(DialogResponse(
                        confirmed: false,
                      ));
                      viewModel.screenManager.back();
                    },
                    showText: true,
                    color: Colors.red[400],
                  ),
                  horizontalSpaceMedium,
                  PrimaryButtonWidget(
                    "Go Home",
                    onTap: viewModel.screenManager.goHome,
                    showText: true,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  @override
  AlertDialogModel viewModelBuilder(BuildContext context) => AlertDialogModel();
}
