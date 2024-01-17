import 'package:otaku_katarougu_app/app/services/social_auth_service.dart';
import 'package:otaku_katarougu_app/domain/repository/auth_repository.dart';

import '../../../app/app.locator.dart';
import '../../../domain/model/profile/profile.dart';
import '../base/view_state.dart';
import '../base/viewmodel.dart';

class VerifyModel extends ViewModel<BaseViewState> {
  final _authRepository = locator<AuthRepository>();
  @override
  void init({String? key, Profile? profile}) async {
    super.init(key: key);

    showLoadingDialog(
        title: "Verifying...",
        description:
            "Hang on, we're unlocking the secret vault to greatness! 🔓🚀 Your account is about to become the VIP of the internet. 🎉🌐 #VerifiedAndStylish");
    (await runBusyFuture(_authRepository.verifyUser(""))).when(
        (verifiedUser) async {
      //Verified.
      screenManager.goToMyProfileScreen();
      showError();
    }, (error) {
      setError(error);
      showError();
    });
  }

  showError() {
    screenManager.back();
    showErrorDialog(description: modelError);
  }
}
