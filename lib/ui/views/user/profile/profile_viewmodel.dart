import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/services/social_auth_service.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';
import 'package:otaku_katarougu_app/ui/dialogs/login_alert/login_alert_dialog_model.dart';

import '../../../../domain/repository/user_repository.dart';
import '../../base/view_state.dart';
import '../../base/viewmodel.dart';

class MyProfileViewModel extends ViewModel<BaseViewState> {
  final _userRepository = locator<UserRepository>();

  List<Profile> _profiles = [];

  @override
  Profile get profile => _profiles.firstOrNull ?? super.profile;

  @override
  void init({String? key, Profile? profile}) async {
    super.init();

    if (!await locator<SocialAuthService>().isSignedIn()) {
      viewState = NotLoggedInState();
      goToLogin();
      return;
    }

    (await runBusyFuture(_userRepository.getProfiles())).when((profiles) {
      _profiles = profiles;
    }, (error) {
      viewState = NoProfilesViewState();
      setError(error);
    });

    (await runBusyFuture(_userRepository.getActiveSubscription())).when(
        (subscription) async {
      viewState = MyProfilesLoadedViewState(_profiles);
    }, (error) {
      setError(error);
      viewState = NoSubscriptionViewState();
      screenManager.goToSubscriptionScreen();
    });
  }

  void setEditProfileState() {
    viewState = EditProfilesViewState();
  }

  @override
  void setBusy(bool value) {
    super.setBusy(value);
    if (value) viewState = LoadingViewState();
  }
}

class MyProfilesLoadedViewState extends InitialState {
  final List<Profile> profiles;
  MyProfilesLoadedViewState(this.profiles);
}

class NoProfilesViewState extends InitialState {
  NoProfilesViewState();
}

class NoSubscriptionViewState extends InitialState {
  NoSubscriptionViewState();
}

class EditProfilesViewState extends InitialState {
  final Profile profile;

  EditProfilesViewState({this.profile = const Profile()});
}
