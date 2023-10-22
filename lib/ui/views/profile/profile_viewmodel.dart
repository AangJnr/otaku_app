import 'package:otaku_katarougu_app/app/app.locator.dart';
import 'package:otaku_katarougu_app/app/app.logger.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';

import '../../../app/app.router.dart';
import '../../../domain/repository/user_repository.dart';
import '../viewmodel.dart';

class ProfileViewModel extends ViewModel {

  @override
  void init({String? key, Profile? profile}) async{

    final key = Uri.base.queryParameters['key'] ?? "";

    getLogger('ProfileViewModel').e(profile.toString());
    profile ??= await runBusyFuture(locator<UserRepository>().getProfile(key));
    if (profile == null) {
       routerService.replaceWith(const SubscriptionViewRoute());
    }
     profile = profile!;

    super.init(key:key, profile:profile);
  }
}
