import 'package:multiple_result/multiple_result.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';
import 'package:otaku_katarougu_app/domain/model/subscription.dart';
import 'package:otaku_katarougu_app/domain/model/upload_photo_request.dart';

import '../model/category/category.dart';

abstract class UserRepository {
  Future<Result<Profile, Exception>> updateProfile(String uid, Profile profile);
  Future<Result<bool, Exception>> updateProfilePhoto(
      UploadPhotoRequest uploadPhotoRequest);
  Future<Profile?> getProfile(String uid);
  Future<Result<Subscription, Exception>> getActiveSubscription();
  Future<Result<List<Category>, Exception>> getCategories();
  Future<Result<Subscription, Exception>> subscribe(
      SubscriptionRequest subscriptionRequest);
  Future<Result<Subscription, Exception>> createAccount(
      SubscriptionRequest subscriptionRequest);
  Future<Result<String, Exception>> sendVerificationLink(String email);
}
