import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'public_profile_viewmodel.dart';

class PublicProfileViewMobile extends ViewModelWidget<PublicProfileViewModel> {
  const PublicProfileViewMobile({super.key});

  @override
  Widget build(BuildContext context, PublicProfileViewModel viewModel) {
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
