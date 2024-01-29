import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthServiceImpl extends SocialAuthService {
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> isSignedIn() async {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  Future<bool> verifyAccessTokenAndSignIn(String accessToken) async {
    try {
      final creds =
          await FirebaseAuth.instance.signInWithCustomToken(accessToken);
      return creds.user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getGoogleAuthToken() async {
    if (kIsWeb) {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      // Once signed in, return the UserCredential
      final userCred =
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      return await userCred.user?.getIdToken();
    }

//Mobile
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCred =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return await userCred.user?.getIdToken();
  }

  @override
  logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void setUpAuthChanges() {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     print('User is signed in!');
    //   }
    // });
  }
}

abstract class SocialAuthService {
  Future<bool> isSignedIn();
  Future<bool> verifyAccessTokenAndSignIn(String accessToken);
  Future<String?> getGoogleAuthToken();
  Future<User?> getCurrentUser();
  void setUpAuthChanges();
  logout();
}
