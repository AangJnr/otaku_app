import 'package:flutter/gestures.dart';

import '../../../app/app.router.dart';
import '../../../domain/model/profile/profile.dart';
import '../../views/viewmodel.dart';

class FooterViewModel extends ViewModel {
  final _termsOfServiceRecognizer = TapGestureRecognizer();
  final _policyRecognizer = TapGestureRecognizer();

  TapGestureRecognizer get termsOfServiceRecognizer =>
      _termsOfServiceRecognizer;

  TapGestureRecognizer get policyRecognizer => _policyRecognizer;

  @override
  void init({String? key, Profile? profile}) async {
    super.init(key: key, profile: profile);
    _policyRecognizer.onTap = () {
      routerService.navigateTo(const TermsAndPolicyViewRoute());
    };

    _termsOfServiceRecognizer.onTap = () {
      routerService.navigateTo(const TermsRoute());
    };
    rebuildUi();
  }

  void triggerSendEmailIntent() {
    launchEmail('aang.jnr@gmail.com');
  }
}
