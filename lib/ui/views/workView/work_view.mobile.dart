import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'work_viewmodel.dart';

class WorkViewMobile extends ViewModelWidget<WorkViewModel> {
  const WorkViewMobile({super.key});

  @override
  Widget build(BuildContext context, WorkViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(),
        ),
      ),
    );
  }
}
