import 'package:otaku_katarougu_app/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../domain/model/profile/profile.dart';
import '../base/view_state.dart';
import '../base/viewmodel.dart';

class TermsAndPolicyModel extends ViewModel<BaseViewState> {
   String get data => locator<RouterService>().router.current.path.contains("terms")
        ? termsAndConditions
        : privacyPolicy;

  @override
  void init({String? key, Profile? profile}) {
    super.init(key: key);
     rebuildUi();
  }
}
