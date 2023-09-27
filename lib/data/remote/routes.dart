
import '../../utils/uri.dart';

abstract class ApiRoutes {
  final url = Url.shared.base;
}

class User extends ApiRoutes {
  String Profile(String uid) => "$url/user/$uid";
  get UploadPhoto  => "$url/user/photo/upload";
  get ActiveSubscription  => "$url/user/subscription/active";
  get Subscribe  => "$url/user/subscribe";
}

class Auth extends ApiRoutes {
  get SignUp  => "$url/admin/user/create";
}

class Admin extends ApiRoutes {
  get Categories  => "$url/admin/category";
}
