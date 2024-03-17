import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/app/services/social_auth_service.dart';
import 'package:otaku_katarougu_app/domain/repository/auth_repository.dart';
import 'package:otaku_katarougu_app/ui/views/base/view_state.dart';
import 'package:otaku_katarougu_app/utils/validators.dart';

import '../../views/base/viewmodel.dart';

enum SubsState { idle, loading, success, failed }

class LoginAlertDialogModel extends ViewModel<BaseViewState> {
  final _authRepository = locator<AuthRepository>();
  String _email = '';
  String get email => _email;
  bool get isEmailValid => Validators.validateEmail(_email).isEmpty == true;

  void login() async {
    viewState = LoadingViewState();

    (await runBusyFuture(_authRepository.sendVerificationLink(_email))).when(
        (success) {
      viewState = VerificationLinkSentViewState(success);
    }, (error) {
      setError(error);
      viewState = ErrorViewState(errorMessage: modelError);
    });
  }

  void updateEmail(String? value) {
    _email = value ?? '';
    rebuildUi();
  }

  void goToProfile() {}

  void performGoogleSignIn() async {
    viewState = LoadingViewState();

    final idToken = await locator<SocialAuthService>().getGoogleAuthToken();
    if (idToken == null) {
      showErrorDialog(
          title: "Sign in failed",
          description:
              "Whoopsie! 🤭 Try again—mistakes are just a detour on the road to awesomeness! 🛣️💫\n#PersistenceWins");
      return;
    }

    (await runBusyFuture(_authRepository.signInWithGoogle(idToken))).when(
        (success) {
      viewState = IdleViewState();
      screenManager.goToMyProfileScreen();
    }, (error) {
      locator<SocialAuthService>().logout();
      setError(error);
      showErrorDialog(title: "Sign in failed", description: modelError);
      getLogger('LoginAlertDialogModel').e(modelError);
    });
  }
}

class LoadingViewState extends InitialState {}

class ErrorViewState extends InitialState {
  final String? errorMessage;
  ErrorViewState({this.errorMessage});
}

class IdleViewState extends InitialState {}

class VerificationLinkSentViewState extends InitialState {
  final String message;
  VerificationLinkSentViewState(this.message);
}
