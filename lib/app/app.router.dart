// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:stacked/stacked.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i8;

import '../domain/model/profile/profile.dart' as _i11;
import '../ui/views/profile/profile_view.dart' as _i2;
import '../ui/views/profileEdit/profile_edit_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/subscription/subscription.dart' as _i5;
import '../ui/views/termsAndPolicy/terms_and_policy.dart' as _i6;
import '../ui/views/unknown/unknown_view.dart' as _i7;
import '../ui/views/workView/work_view.dart' as _i4;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i8.StackedService.navigatorKey);

class StackedRouterWeb extends _i9.RootStackRouter {
  StackedRouterWeb({_i10.GlobalKey<_i10.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileViewArgs>(
          orElse: () => const ProfileViewArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.ProfileView(
          profile: args.profile,
          key: args.key,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileEditViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileEditViewArgs>(
          orElse: () => const ProfileEditViewArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.ProfileEditView(
          profile: args.profile,
          key: args.key,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    WorkViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<WorkViewArgs>(orElse: () => const WorkViewArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.WorkView(
          profile: args.profile,
          key: args.key,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SubscriptionViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.SubscriptionView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TermsAndPolicyViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.TermsAndPolicyView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TermsRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.TermsAndPolicyView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      final args = routeData.argsAs<UnknownViewArgs>(
          orElse: () => const UnknownViewArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.UnknownView(
          title: args.title,
          pageRoute: args.pageRoute,
          message: args.message,
          key: args.key,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          ProfileViewRoute.name,
          path: '/profile-view',
        ),
        _i9.RouteConfig(
          ProfileEditViewRoute.name,
          path: '/my-profile',
        ),
        _i9.RouteConfig(
          WorkViewRoute.name,
          path: '/relevant-experience',
        ),
        _i9.RouteConfig(
          SubscriptionViewRoute.name,
          path: '/subscription-view',
        ),
        _i9.RouteConfig(
          TermsAndPolicyViewRoute.name,
          path: 'policy',
        ),
        _i9.RouteConfig(
          TermsRoute.name,
          path: 'terms',
        ),
        _i9.RouteConfig(
          UnknownViewRoute.name,
          path: '/unknown',
        ),
        _i9.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/unknown',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i9.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.ProfileView]
class ProfileViewRoute extends _i9.PageRouteInfo<ProfileViewArgs> {
  ProfileViewRoute({
    _i11.Profile? profile,
    _i10.Key? key,
  }) : super(
          ProfileViewRoute.name,
          path: '/profile-view',
          args: ProfileViewArgs(
            profile: profile,
            key: key,
          ),
        );

  static const String name = 'ProfileView';
}

class ProfileViewArgs {
  const ProfileViewArgs({
    this.profile,
    this.key,
  });

  final _i11.Profile? profile;

  final _i10.Key? key;

  @override
  String toString() {
    return 'ProfileViewArgs{profile: $profile, key: $key}';
  }
}

/// generated route for
/// [_i3.ProfileEditView]
class ProfileEditViewRoute extends _i9.PageRouteInfo<ProfileEditViewArgs> {
  ProfileEditViewRoute({
    _i11.Profile? profile,
    _i10.Key? key,
  }) : super(
          ProfileEditViewRoute.name,
          path: '/my-profile',
          args: ProfileEditViewArgs(
            profile: profile,
            key: key,
          ),
        );

  static const String name = 'ProfileEditView';
}

class ProfileEditViewArgs {
  const ProfileEditViewArgs({
    this.profile,
    this.key,
  });

  final _i11.Profile? profile;

  final _i10.Key? key;

  @override
  String toString() {
    return 'ProfileEditViewArgs{profile: $profile, key: $key}';
  }
}

/// generated route for
/// [_i4.WorkView]
class WorkViewRoute extends _i9.PageRouteInfo<WorkViewArgs> {
  WorkViewRoute({
    _i11.Profile? profile,
    _i10.Key? key,
  }) : super(
          WorkViewRoute.name,
          path: '/relevant-experience',
          args: WorkViewArgs(
            profile: profile,
            key: key,
          ),
        );

  static const String name = 'WorkView';
}

class WorkViewArgs {
  const WorkViewArgs({
    this.profile,
    this.key,
  });

  final _i11.Profile? profile;

  final _i10.Key? key;

  @override
  String toString() {
    return 'WorkViewArgs{profile: $profile, key: $key}';
  }
}

/// generated route for
/// [_i5.SubscriptionView]
class SubscriptionViewRoute extends _i9.PageRouteInfo<void> {
  const SubscriptionViewRoute()
      : super(
          SubscriptionViewRoute.name,
          path: '/subscription-view',
        );

  static const String name = 'SubscriptionView';
}

/// generated route for
/// [_i6.TermsAndPolicyView]
class TermsAndPolicyViewRoute extends _i9.PageRouteInfo<void> {
  const TermsAndPolicyViewRoute()
      : super(
          TermsAndPolicyViewRoute.name,
          path: 'policy',
        );

  static const String name = 'TermsAndPolicyView';
}

/// generated route for
/// [_i6.TermsAndPolicyView]
class TermsRoute extends _i9.PageRouteInfo<void> {
  const TermsRoute()
      : super(
          TermsRoute.name,
          path: 'terms',
        );

  static const String name = 'Terms';
}

/// generated route for
/// [_i7.UnknownView]
class UnknownViewRoute extends _i9.PageRouteInfo<UnknownViewArgs> {
  UnknownViewRoute({
    String? title = '404',
    _i9.PageRouteInfo<dynamic>? pageRoute,
    String? message = 'PAGE NOT FOUND',
    _i10.Key? key,
  }) : super(
          UnknownViewRoute.name,
          path: '/unknown',
          args: UnknownViewArgs(
            title: title,
            pageRoute: pageRoute,
            message: message,
            key: key,
          ),
        );

  static const String name = 'UnknownView';
}

class UnknownViewArgs {
  const UnknownViewArgs({
    this.title = '404',
    this.pageRoute,
    this.message = 'PAGE NOT FOUND',
    this.key,
  });

  final String? title;

  final _i9.PageRouteInfo<dynamic>? pageRoute;

  final String? message;

  final _i10.Key? key;

  @override
  String toString() {
    return 'UnknownViewArgs{title: $title, pageRoute: $pageRoute, message: $message, key: $key}';
  }
}

extension RouterStateExtension on _i8.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProfileView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProfileViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProfileEditView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProfileEditViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToWorkView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      WorkViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSubscriptionView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SubscriptionViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTermsAndPolicyView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TermsAndPolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTerms(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TermsAndPolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView({
    String? title = '404',
    _i9.PageRouteInfo<dynamic>? pageRoute,
    String? message = 'PAGE NOT FOUND',
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      UnknownViewRoute(
        title: title,
        pageRoute: pageRoute,
        message: message,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProfileView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProfileViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProfileEditView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProfileEditViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithWorkView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      WorkViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSubscriptionView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SubscriptionViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTermsAndPolicyView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TermsAndPolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTerms(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TermsAndPolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView({
    String? title = '404',
    _i9.PageRouteInfo<dynamic>? pageRoute,
    String? message = 'PAGE NOT FOUND',
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      UnknownViewRoute(
        title: title,
        pageRoute: pageRoute,
        message: message,
        key: key,
      ),
      onFailure: onFailure,
    );
  }
}
