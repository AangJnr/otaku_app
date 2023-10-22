import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/widgets/relevant_work_item.dart';

 import '../../common/ui_helpers.dart';
import '../../widgets/footer/footer_widget.dart';
import 'work_viewmodel.dart';

class WorkViewWidget extends StatelessWidget {
  final WorkViewModel viewModel;
  const WorkViewWidget(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = viewModel.appTheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceLarge,
          Text(
            "WORK\nEXPERIENCE",
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .primaryTextTheme
                .titleLarge
                ?.copyWith(color: theme.accentColor),
          ),
          verticalSpaceLarge,
          ...viewModel.profile.relevantWorks
              .map((e) => RelevantWorkItem(e, appTheme: viewModel.appTheme,))
              .toList(),
          verticalSpaceLarge,

          const FooterWidget(),
          verticalSpaceLarge,
        ],
      ),
    );
  }
}
