import 'package:otaku_katarougu_app/app/services/screen_manager.dart';
import 'package:otaku_katarougu_app/data/remote/api_service_impl.dart';
import 'package:otaku_katarougu_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:otaku_katarougu_app/ui/views/publicProfile/public_profile_view.dart';
import 'package:otaku_katarougu_app/ui/views/startup/startup_view.dart';
import 'package:otaku_katarougu_app/ui/views/subscription/subscription.dart';
import 'package:otaku_katarougu_app/ui/views/termsAndPolicy/terms_and_policy.dart';
import 'package:otaku_katarougu_app/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../data/local/session_manager_service.dart';
import '../data/remote/repository/user_repository_impl.dart';
import '../domain/api/api_service.dart';
import '../domain/model/session_manager.dart';
import '../domain/repository/user_repository.dart';
import '../ui/dialogs/login_alert/login_alert_dialog.dart';
import '../ui/dialogs/subscription_alert/subscription_alert_dialog.dart';
import '../ui/views/user/profile/profile_view.dart';
import '../ui/views/workView/work_view.dart';
import 'services/location_service.dart';
import 'services/toast_service.dart';

// @stacked-import
@StackedApp(
  logger: StackedLogger(),
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: PublicProfileView, path: '/public-profile'),
    CustomRoute(page: MyProfileView, path: '/me'),
    //CustomRoute(page: ProfileEditView, path:'/my-profile'),
    CustomRoute(page: WorkView, path: '/relevant-experience'),
    CustomRoute(page: SubscriptionView, path: '/subscribe'),
    // @stacked-route
    CustomRoute(page: TermsAndPolicyView, path: '/policy', name: 'policyView'),
    CustomRoute(page: TermsAndPolicyView, path: '/terms', name: 'termsView'),
    CustomRoute(page: UnknownView, path: '/unknown'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/unknown'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: ToastService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: UserRepositoryImpl, asType: UserRepository),
    LazySingleton(classType: SessionManagerImpl, asType: SessionManager),
    LazySingleton(classType: ApiServiceImpl, asType: ApiService),
    LazySingleton(
        classType: ScreenManagerServiceImpl, asType: ScreenManagerService)
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: SubscriptionAlertDialog),
    StackedDialog(classType: LoginAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
