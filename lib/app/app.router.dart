// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:stacked/stacked.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i8;

import '../domain/model/profile/profile.dart' as _i11;
import '../ui/views/publicProfile/public_profile_view.dart' as _i2;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/subscription/subscription.dart' as _i5;
import '../ui/views/termsAndPolicy/terms_and_policy.dart' as _i6;
import '../ui/views/unknown/unknown_view.dart' as _i7;
import '../ui/views/user/profile/profile_view.dart' as _i3;
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
    PublicProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<PublicProfileViewArgs>(
          orElse: () => const PublicProfileViewArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.PublicProfileView(
          profile: args.profile,
          key: args.key,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MyProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<MyProfileViewArgs>(
          orElse: () => const MyProfileViewArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.MyProfileView(
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
    PolicyViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.TermsAndPolicyView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TermsViewRoute.name: (routeData) {
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
          PublicProfileViewRoute.name,
          path: '/public-profile',
        ),
        _i9.RouteConfig(
          MyProfileViewRoute.name,
          path: '/me',
        ),
        _i9.RouteConfig(
          WorkViewRoute.name,
          path: '/relevant-experience',
        ),
        _i9.RouteConfig(
          SubscriptionViewRoute.name,
          path: '/subscribe',
        ),
        _i9.RouteConfig(
          PolicyViewRoute.name,
          path: '/policy',
        ),
        _i9.RouteConfig(
          TermsViewRoute.name,
          path: '/terms',
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
/// [_i2.PublicProfileView]
class PublicProfileViewRoute extends _i9.PageRouteInfo<PublicProfileViewArgs> {
  PublicProfileViewRoute({
    _i11.Profile? profile,
    _i10.Key? key,
  }) : super(
          PublicProfileViewRoute.name,
          path: '/public-profile',
          args: PublicProfileViewArgs(
            profile: profile,
            key: key,
          ),
        );

  static const String name = 'PublicProfileView';
}

class PublicProfileViewArgs {
  const PublicProfileViewArgs({
    this.profile,
    this.key,
  });

  final _i11.Profile? profile;

  final _i10.Key? key;

  @override
  String toString() {
    return 'PublicProfileViewArgs{profile: $profile, key: $key}';
  }
}

/// generated route for
/// [_i3.MyProfileView]
class MyProfileViewRoute extends _i9.PageRouteInfo<MyProfileViewArgs> {
  MyProfileViewRoute({
    _i11.Profile? profile,
    _i10.Key? key,
  }) : super(
          MyProfileViewRoute.name,
          path: '/me',
          args: MyProfileViewArgs(
            profile: profile,
            key: key,
          ),
        );

  static const String name = 'MyProfileView';
}

class MyProfileViewArgs {
  const MyProfileViewArgs({
    this.profile,
    this.key,
  });

  final _i11.Profile? profile;

  final _i10.Key? key;

  @override
  String toString() {
    return 'MyProfileViewArgs{profile: $profile, key: $key}';
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
          path: '/subscribe',
        );

  static const String name = 'SubscriptionView';
}

/// generated route for
/// [_i6.TermsAndPolicyView]
class PolicyViewRoute extends _i9.PageRouteInfo<void> {
  const PolicyViewRoute()
      : super(
          PolicyViewRoute.name,
          path: '/policy',
        );

  static const String name = 'PolicyView';
}

/// generated route for
/// [_i6.TermsAndPolicyView]
class TermsViewRoute extends _i9.PageRouteInfo<void> {
  const TermsViewRoute()
      : super(
          TermsViewRoute.name,
          path: '/terms',
        );

  static const String name = 'TermsView';
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

  Future<dynamic> navigateToPublicProfileView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      PublicProfileViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMyProfileView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      MyProfileViewRoute(
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

  Future<dynamic> navigateToPolicyView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const PolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTermsView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const TermsViewRoute(),
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

  Future<dynamic> replaceWithPublicProfileView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      PublicProfileViewRoute(
        profile: profile,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMyProfileView({
    _i11.Profile? profile,
    _i10.Key? key,
    void Function(_i9.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      MyProfileViewRoute(
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

  Future<dynamic> replaceWithPolicyView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const PolicyViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTermsView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const TermsViewRoute(),
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
