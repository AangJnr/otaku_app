import 'package:http/http.dart' show Response, StreamedResponse;

import '../model/profile/profile.dart';
import '../model/subscription.dart';
import '../model/upload_photo_request.dart';

abstract class ApiService {
  Future<Response> createUser(SubscriptionRequest subscriptionRequest);
  Future<Response> getPublicProfile(String uid);
    Future<Response> getMyProfiles();
  Future<Response> editProfile(String uid, Profile profile);
  Future<Response> uploadPhoto(UploadPhotoRequest request);
  Future<Response> subscribe(SubscriptionRequest subscriptionRequest);
  Future<Response> activeSubscription();
  Future<Response> getCategories();
  Future<Response> sendVerificationLink(String email);
  Future<Response> signInWithGoogle(String idToken);
  Future<Response> verifyEmail(String token);
  Future<Response> logout();
}
