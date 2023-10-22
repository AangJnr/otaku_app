import 'package:stacked/stacked.dart';
import 'package:otaku_katarougu_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../domain/repository/user_repository.dart';

class StartupViewModel extends BaseViewModel {
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    final key = Uri.base.queryParameters['key'] ?? "hj6GwLtpGFluhMOp7eQEnZ0HOOPJ";

    final profile =
        await runBusyFuture(locator<UserRepository>().getProfile(key));

    if (profile == null) {
      locator<RouterService>().replaceWith(const SubscriptionViewRoute());
    }
    locator<RouterService>().replaceWith(ProfileViewRoute(profile: profile));
  }
}
