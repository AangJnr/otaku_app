import 'package:multiple_result/multiple_result.dart';
import 'package:otaku_katarougu_app/domain/model/subscription.dart';

import '../../data/model/auth/verify_user_request.dart';

abstract class AuthRepository {

  Future<Result<UserVerifiedResponseApi, Exception>> signInWithGoogle(
      String idToken );
  Future<Result<UserVerifiedResponseApi, Exception>> verifyUser(
      String token);
  Future<Result<String, Exception>> sendVerificationLink(String email);
}
