import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/domain/repository/user_repository.dart';
import 'package:otaku_katarougu_app/utils/validators.dart';

import '../../views/viewmodel.dart';

enum SubsState { idle, loading, success, failed }

class LoginAlertDialogModel extends ViewModel {
  final _userRepository = locator<UserRepository>();
  SubsState _state = SubsState.idle;
  SubsState get state => _state;
  String _email = '';
  String _message = '';
  String get message => _message;
  String get email => _email;
  bool get isEmailValid => Validators.validateEmail(_email).isEmpty == true;

  void login() async {
    setState(SubsState.loading);
    rebuildUi();
    await runBusyFuture(
        Future.delayed(const Duration(seconds: 3)).then((v) {}));
    (await runBusyFuture(_userRepository.login(_email))).when((success) {
      setState(SubsState.success);
      _message = success;
    }, (error) {
      setError(error);
      setState(SubsState.failed);
    });
  }

  setState(newState) {
    _state = newState;
    rebuildUi();
  }

  void updateEmail(String? value) {
    _email = value ?? '';
    rebuildUi();
  }

  void goToProfile() {}
}
