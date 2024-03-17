import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class MyProfileViewMobile extends ViewModelWidget<MyProfileViewModel> {
  const MyProfileViewMobile({super.key});

  @override
  Widget build(BuildContext context, MyProfileViewModel viewModel) {
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
