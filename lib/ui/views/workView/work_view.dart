import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/model/profile/profile.dart';
import 'work_view.desktop.dart';
import 'work_view.mobile.dart';
import 'work_viewmodel.dart';

class WorkView extends StackedView<WorkViewModel> {
  final Profile? profile;
  const WorkView({this.profile, super.key});

  @override
  Widget builder(
    BuildContext context,
    WorkViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const WorkViewMobile(),
      tablet: (_) => const WorkViewDesktop(),
      desktop: (_) => const WorkViewDesktop(),
    );
  }

  @override
  void onViewModelReady(WorkViewModel viewModel) {
    viewModel.init(profile: profile);
    super.onViewModelReady(viewModel);
  }

  @override
  WorkViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WorkViewModel();
}
