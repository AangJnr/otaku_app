
import 'package:multiple_result/multiple_result.dart';
import 'package:otaku_katarougu_app/data/model/auth/verify_user_request.dart';
import 'package:otaku_katarougu_app/domain/repository/auth_repository.dart';
import 'package:otaku_katarougu_app/domain/repository/user_repository.dart';
import '../../../app/app.locator.dart';
import '../../../app/services/social_auth_service.dart';
import 'base_repository.dart';

class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  @override
  Future<Result<String, Exception>> sendVerificationLink(String email) async {
    var data =
        await processRequest(() => apiService.sendVerificationLink(email));
    if (data.isSuccess()) {
      return Success(data.tryGetSuccess()!.toString());
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<UserVerifiedResponseApi, Exception>> signInWithGoogle(
      String idToken) async {
    var data = await processRequest(() => apiService.signInWithGoogle(idToken));
    if (data.isSuccess()) {
      final userVerified =
          UserVerifiedResponseApi.fromMap(data.tryGetSuccess()!);
      sessionManager.setAccessToken(userVerified.token);
      getUser();
      return Success(userVerified);
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<Result<UserVerifiedResponseApi, Exception>> verifyUser(
      String token) async {
    var data = await processRequest(() => apiService.verifyEmail(token));
    if (data.isSuccess()) {
      final userVerified =
          UserVerifiedResponseApi.fromMap(data.tryGetSuccess()!);
      if (await locator<SocialAuthService>()
          .verifyAccessTokenAndSignIn(userVerified.token)) {
        sessionManager.setAccessToken(userVerified.token);
        getUser();
        return Success(userVerified);
      }
    }
    return Future.value(Error(data.tryGetError()!));
  }

  @override
  Future<bool> logout() async {
    var data = await processRequest(() => apiService.logout());
    return Future.value(data.isSuccess());
  }

  Future getUser() => locator<UserRepository>().getUser();
}
