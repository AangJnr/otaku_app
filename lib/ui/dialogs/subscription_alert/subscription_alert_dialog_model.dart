import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/domain/repository/user_repository.dart';
import 'package:otaku_katarougu_app/utils/validators.dart';

import '../../../domain/model/category/category.dart';
import '../../../domain/model/subscription.dart';
import '../../views/base/viewmodel.dart';

enum SubsState { idle, loading, subscribed, failed }

class SubscriptionAlertDialogModel extends ViewModel {
  final _userRepository = locator<UserRepository>();
  SubsState _subscriptionState = SubsState.idle;
  SubsState get subscriptionState => _subscriptionState;
  String _email = '';
  String get email => _email;
  bool get isEmailValid => Validators.validateEmail(_email).isEmpty == true;

  void subscribe(Category category) async {
    setState(SubsState.loading);
    rebuildUi();

    (await runBusyFuture(_userRepository.createAccount(
            SubscriptionRequest(email: _email, categoryUid: category.uid))))
        .when((success) {
      setState(SubsState.subscribed);
    }, (error) {
      setState(SubsState.failed);
      setError(error);
     });
  }

  setState(newState) {
    _subscriptionState = newState;
    rebuildUi();
  }

  void updateEmail(String? value) {
    _email = value ?? '';
    rebuildUi();
  }

  void goToProfile() {}
}
