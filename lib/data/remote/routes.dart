// ignore_for_file: non_constant_identifier_names

import '../../utils/uri.dart';

abstract class ApiRoutes {
  final url = Url.shared.base;
}

class UserRoute extends ApiRoutes {
  String PublicProfile(String uid) => "$url/user/public-profile/$uid";
  String MyActiveProfile(String uid) => "$url/user/profile/me";
  get MyProfiles => "$url/user/profiles";
  get Me => "$url/user/me";
  get SignUp => "$url/user/create";

  String Profile(String uid) => "$url/user/profile/$uid";

  get UploadPhoto => "$url/user/photo/upload";
  get ActiveSubscription => "$url/user/subscription/active";
  get Subscribe => "$url/user/subscribe";
}

class Auth extends ApiRoutes {
  String sendEmailVerificationLink(String email) =>
      "$url/auth/send-verification-link/$email";
  get SignInWithGoogle => "$url/auth/social-login/google";
  get VerifyEmailUser => "$url/auth/verify";
  get LogOut => "$url/auth/logout";
}

class Admin extends ApiRoutes {
  get Categories => "$url/admin/category";
}
