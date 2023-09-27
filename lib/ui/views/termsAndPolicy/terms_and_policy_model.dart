
import 'package:otaku_katarougu_app/ui/common/app_strings.dart';

import '../../../domain/model/profile/profile.dart';
import '../viewmodel.dart';

class TermsAndPolicyModel extends  ViewModel {
String _description = '';
  String get data => _description;
  @override
  void init({String? key, Profile? profile})  {
    super.init(key:key);
    _description = Uri.base.pathSegments.last == "terms" ? termsAndConditions : privacyPolicy;
    rebuildUi();
  }
}