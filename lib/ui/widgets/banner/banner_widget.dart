import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../domain/model/profile/profile.dart';
import '../../views/base/view_state.dart';
import '../../views/base/viewmodel.dart';

class SideBannerImageWidget extends StackedView<BannerViewModel> {
  const SideBannerImageWidget({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, BannerViewModel viewModel, Widget? child) {
    return Material(
      shadowColor: Colors.black26,
      elevation: 0,
      color: Colors.transparent,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: viewModel.bannerImageLoaded
            ? Image.asset(
                viewModel.bannerImageUrl,
                fit: BoxFit.contain,
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  BannerViewModel viewModelBuilder(BuildContext context) => BannerViewModel();

  @override
  void onViewModelReady(BannerViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }
}

class BannerViewModel extends ViewModel<BaseViewState> {
  @override
  void init({String? key, Profile? profile}) async {
    super.init(key: key);

    rebuildUi();
  }
}
