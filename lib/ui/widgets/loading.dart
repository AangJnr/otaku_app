import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:otaku_katarougu_app/ui/views/base/viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoadingWidget extends StackedView<LoadingViewModel> {
  final Size? size;

  const LoadingWidget({this.size = const Size(100, 100), super.key});

  @override
  @override
  Widget builder(
      BuildContext context, LoadingViewModel viewModel, Widget? child) {
    return Center(
      child: SizedBox(
        width: size!.width,
        height: size!.height,
        child: LoadingIndicator(
          indicatorType: Indicator.orbit,
          pathBackgroundColor: viewModel.appTheme.primaryBackgroundColor,
          colors: [viewModel.appTheme.accentColor!],
        ),
      ),
    );
  }

  @override
  LoadingViewModel viewModelBuilder(BuildContext context) => LoadingViewModel();
}

class LoadingViewModel extends ViewModel {}
