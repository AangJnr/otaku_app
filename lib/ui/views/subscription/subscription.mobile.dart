import 'package:otaku_katarougu_app/ui/common/app_colors.dart';
import 'package:otaku_katarougu_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'subscription_model.dart';

class SubscriptionMobile extends ViewModelWidget<SubscriptionModel> {
  const SubscriptionMobile({super.key});

  @override
  Widget build(BuildContext context, SubscriptionModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(

          ),
        ),
      ),
    );
  }
}
