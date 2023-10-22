import 'package:firebase_auth/firebase_auth.dart';

class SocialAuthService {
  final firebaseAuth = FirebaseAuth.instance;
  Future<bool> isSignedIn() async {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<String?> getFacebookToken() async {
    return Future.value("");
  }
}
