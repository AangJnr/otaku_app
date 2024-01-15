import 'package:flutter/gestures.dart';

import '../../../app/app.router.dart';
import '../../../domain/model/profile/profile.dart';
import '../../views/base/view_state.dart';
import '../../views/base/viewmodel.dart';

class FooterViewModel extends ViewModel<BaseViewState> {
  final _termsOfServiceRecognizer = TapGestureRecognizer();
  final _policyRecognizer = TapGestureRecognizer();

  TapGestureRecognizer get termsOfServiceRecognizer =>
      _termsOfServiceRecognizer;

  TapGestureRecognizer get policyRecognizer => _policyRecognizer;

  @override
  void init({String? key, Profile? profile}) async {
    super.init(key: key, profile: profile);
    _policyRecognizer.onTap = () {
      screenManager.goToPrivacyPolicyScreen();
    };

    _termsOfServiceRecognizer.onTap = () {
      screenManager.goToTermsScreen();
    };
    rebuildUi();
  }

  void triggerSendEmailIntent() {
    launchEmail('aang.jnr@gmail.com');
  }
}
