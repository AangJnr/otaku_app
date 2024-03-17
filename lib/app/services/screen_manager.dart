import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../domain/model/profile/profile.dart';
import '../app.locator.dart';
import '../app.router.dart';

abstract class ScreenManagerService {
  void goToPublicProfileScreen(Profile? profile, {String? key});
  void goToMyProfileScreen({Profile? profile});
  void goToSubscriptionScreen({bool shouldReplace = false});
  void goToPrivacyPolicyScreen();
  void goToTermsScreen();
  void goToUnknownScreen(
      {String? title, String? message, PageRouteInfo<dynamic>? pageRoute});
  void goToPublicWorkAndExperiecesScreen(Profile? profile);
  void goTo(PageRouteInfo pageRouteInfo);
  void goHome();
  void back();
}

class ScreenManagerServiceImpl implements ScreenManagerService {
  final _routerService = locator<RouterService>();
  @override
  void goToUnknownScreen(
      {String? title, String? message, PageRouteInfo? pageRoute}) {
    _routerService.navigateTo(UnknownViewRoute(
        title: "Uh Oh!.",
        message: "Something bad happened\nTry a page refresh?",
        pageRoute: const SubscriptionViewRoute()));
  }

  @override
  void goToMyProfileScreen({Profile? profile}) {
    _routerService.navigateTo(MyProfileViewRoute(profile: profile));
  }

  @override
  void goToPrivacyPolicyScreen() {
    _routerService.navigateTo(const PolicyViewRoute());
  }

  @override
  void goToPublicProfileScreen(Profile? profile, {String? key}) {
    final pageRoute = PublicProfileViewRoute(profile: profile);

    _routerService.navigateTo(PageRouteInfo(pageRoute.routeName,
        path: pageRoute.path,
        rawQueryParams: {"user": key ?? profile?.uid},
        args: pageRoute.args));
  }

  @override
  void goToSubscriptionScreen({bool shouldReplace = false}) {
    if (shouldReplace) {
      _routerService.replaceWith(const SubscriptionViewRoute());
      return;
    }
    _routerService.navigateTo(const SubscriptionViewRoute());
  }

  @override
  void goToTermsScreen() {
    _routerService.navigateTo(const TermsViewRoute());
  }

  @override
  void goTo(PageRouteInfo pageRouteInfo) {
    _routerService.replaceWith(pageRouteInfo);
  }

  @override
  void goToPublicWorkAndExperiecesScreen(Profile? profile) {
    _routerService.navigateTo(WorkViewRoute(profile: profile));
  }

  @override
  void goHome() {
    _routerService.navigateToPath(path: "/");
  }

  @override
  void back() {
    _routerService.back();
  }
}
