import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'verify_model.dart';

class TermsAndPolicyMobile extends ViewModelWidget<VerifyModel> {
  const TermsAndPolicyMobile({super.key});

  @override
  Widget build(BuildContext context, VerifyModel viewModel) {
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
