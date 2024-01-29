import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';

import '../../../domain/repository/user_repository.dart';
import '../base/view_state.dart';
import '../base/viewmodel.dart'; //baby boy

class PublicProfileViewModel extends ViewModel<BaseViewState> {
  String _key = '';

  @override
  void init({Profile? profile}) async {
    if (profile != null) {
      viewState = ProfileLoadedViewState(profile);
      super.init(profile: profile);

      return;
    }

    _key = Uri.base.queryParameters['user'] ?? "";
    (await runBusyFuture(locator<UserRepository>().getPublicProfile(_key)))
        .when((publicProfile) {
      viewState = ProfileLoadedViewState(publicProfile!);
      super.init(profile: publicProfile);
    }, (error) {
      screenManager.goToSubscriptionScreen(shouldReplace: false);
    });
  }
}



class ProfileLoadedViewState extends InitialState {
  final Profile profile;
  ProfileLoadedViewState(this.profile);
}
