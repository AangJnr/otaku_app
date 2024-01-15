import 'package:flutter/foundation.dart';
import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';

import '../../../domain/repository/user_repository.dart';
import '../base/view_state.dart';
import '../base/viewmodel.dart';

class PublicProfileViewModel extends ViewModel<BaseViewState> {
  @override
  void init({String? key, Profile? profile}) async {
    final key = Uri.base.queryParameters['key'] ?? "";

    getLogger('ProfileViewModel').e(profile.toString());
    profile ??= await runBusyFuture(locator<UserRepository>().getProfile(key));
    if (profile == null) {
      screenManager.goToSubscriptionScreen(shouldReplace: true);
    }
    profile = profile!;
    viewState = ProfileLoadedViewState(profile);

    super.init(key: key, profile: profile);

  }
}

class ProfileLoadedViewState extends InitialState {
  final Profile profile;
  ProfileLoadedViewState(this.profile) : super();
}
