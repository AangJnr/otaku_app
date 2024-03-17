import 'package:flutter/material.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';

import '../../config/theme_setup.dart';
import '../../domain/model/profile/relevant_work.dart';

class RelevantWorkItem extends StatelessWidget {
  final AppTheme? appTheme;
  final RelevantWork relevantWork;
  const RelevantWorkItem(this.relevantWork, {this.appTheme, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = appTheme ?? SilverTheme();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceMedium,
        Text(
          relevantWork.title,
          textAlign: TextAlign.left,
          style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                color: theme.primaryTextColor,
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
        ),
        verticalSpaceSmall,
        Text(
          relevantWork.role.toUpperCase(),
          textAlign: TextAlign.left,
          style: Theme.of(context).primaryTextTheme.displayMedium?.copyWith(
              color: theme.accentColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        verticalSpaceTiny,
        Text(
          relevantWork.description,
          textAlign: TextAlign.left,
          style: Theme.of(context).primaryTextTheme.displayMedium?.copyWith(
              color: theme.primaryTextColor?.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        verticalSpaceMedium,
        const Divider()
      ],
    );
  }
}
