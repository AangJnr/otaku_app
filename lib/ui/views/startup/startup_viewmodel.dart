import 'package:otaku_katarougu_app/app/services/screen_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:otaku_katarougu_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../domain/repository/user_repository.dart';

class StartupViewModel extends BaseViewModel {
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    final key =
        Uri.base.queryParameters['key']; // ??"uJVFpwN9KlVsrneU3QdBOrxtjjf9";

    if (key == null) {
      locator<ScreenManagerService>()
          .goToSubscriptionScreen(shouldReplace: true);
      return;
    }
    final profile =
        await runBusyFuture(locator<UserRepository>().getPublicProfile(key));

    if (profile == null) {
      locator<ScreenManagerService>().goToSubscriptionScreen();
    }
    locator<ScreenManagerService>().goToPublicProfileScreen(profile);
  }
}
