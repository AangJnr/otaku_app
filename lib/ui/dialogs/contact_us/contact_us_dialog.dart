import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otaku_katarougu_app/config/theme_setup.dart';
import 'package:otaku_katarougu_app/main.dart';
import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:otaku_katarougu_app/ui/widgets/back_drop_filter_widget.dart';
import 'package:otaku_katarougu_app/ui/widgets/primary_button_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../domain/model/category/category.dart';
import '../../widgets/labeled_form_field.dart';
import '../../widgets/loading.dart';
import 'contact_us_model.dart';

const double _graphicSize = 60;

class ContactUsDialog extends StackedView<ContactUsDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ContactUsDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactUsDialogModel viewModel,
    Widget? child,
  ) {
    final category = request.data! as Category;
    return BlurView(
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxHeight: 450, maxWidth: 600),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: _buildSubscriptionWidget(context, viewModel, category),
      ),
    );
  }

  @override
  ContactUsDialogModel viewModelBuilder(BuildContext context) =>
      ContactUsDialogModel();

  Widget _buildSubscriptionWidget(
      BuildContext context, ContactUsDialogModel viewModel, Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Contact\t',
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    height: 1.4,
                    color: Colors.black,
                    fontSize: 30),
              ),
              TextSpan(
                text: 'Us',
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
        Column(
          mainAxisSize: MainAxisSize.min,
          children: category.features
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
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
}
