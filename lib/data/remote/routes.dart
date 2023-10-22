// ignore_for_file: non_constant_identifier_names

import '../../utils/uri.dart';

abstract class ApiRoutes {
  final url = Url.shared.base;
}

class User extends ApiRoutes {
  String Profile(String uid) => "$url/user/profile/$uid";
  get UploadPhoto => "$url/user/photo/upload";
  get ActiveSubscription => "$url/user/subscription/active";
  get Subscribe => "$url/user/subscribe";
}

class Auth extends ApiRoutes {
  get SignUp => "$url/user/create";
  String login(String email) => "$url/send-verification-link/$email";
}

class Admin extends ApiRoutes {
  get Categories => "$url/admin/category";
}
