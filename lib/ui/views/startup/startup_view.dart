import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:otaku_katarougu_app/ui/widgets/logo_widget.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/loading.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LogoWidget(size: Size(150, 150)),
            LoadingWidget(size: Size(70, 70)),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) {
    return SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
  }
}
