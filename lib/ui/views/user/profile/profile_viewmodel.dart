import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/services/social_auth_service.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';

import '../../../../domain/repository/user_repository.dart';
import '../../base/view_state.dart';
import '../../base/viewmodel.dart';

class MyProfileViewModel extends ViewModel<BaseViewState> {
  @override
  void init({String? key, Profile? profile}) async {
    super.init();

    if (!await locator<SocialAuthService>().isSignedIn()) {
      viewState = NotLoggedInState();
      goToLogin();
      return;
    }

    (await runBusyFuture(locator<UserRepository>().getProfiles())).when(
        (profiles) {
      viewState = MyProfilesLoadedViewState(profiles);
    }, (error) {
      setError(error);
      showErrorDialog(
          description:
              "Something happened! We are investigating the issue. Sit tight!");
    });
  }

  void setEditProfileState() {}
}

class MyProfilesLoadedViewState extends InitialState {
  final List<Profile> profiles;
  MyProfilesLoadedViewState(this.profiles);
}

class NoProfilesViewState extends InitialState {
  NoProfilesViewState();
}

class EditProfilesViewState extends InitialState {
  final Profile profile;

  EditProfilesViewState({this.profile = const Profile()});
}
