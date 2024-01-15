import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/domain/repository/user_repository.dart';
import 'package:otaku_katarougu_app/ui/views/base/view_state.dart';
import 'package:otaku_katarougu_app/utils/validators.dart';

import '../../views/base/viewmodel.dart';

enum SubsState { idle, loading, success, failed }

class LoginAlertDialogModel extends ViewModel<BaseViewState> {
  final _userRepository = locator<UserRepository>();
  String _email = '';
  String get email => _email;
  bool get isEmailValid => Validators.validateEmail(_email).isEmpty == true;

  void login() async {
    viewState = LoadingViewState();

    (await runBusyFuture(_userRepository.sendVerificationLink(_email))).when(
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
