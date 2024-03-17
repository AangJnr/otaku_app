import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/app/services/screen_manager.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../domain/repository/user_repository.dart';

class StartupViewModel extends BaseViewModel {
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    final key = Uri.base.queryParameters['user'];

    getLogger('StartupViewModel').e(key);
    if (key == null) {
      locator<ScreenManagerService>()
          .goToSubscriptionScreen(shouldReplace: true);
      return;
    }
    (await runBusyFuture(locator<UserRepository>().getPublicProfile(key))).when(
        (profile) {
      locator<ScreenManagerService>()
          .goToPublicProfileScreen(profile, key: key);
    }, (error) {
      locator<ScreenManagerService>()
          .goToSubscriptionScreen(shouldReplace: true);
    });
  }
}
