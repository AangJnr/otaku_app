import 'dart:convert';

class VerifyUserApiRequest {
  final String token;
  const VerifyUserApiRequest(this.token);

  Map<String, dynamic> toMap() => {"token": token};

  String toJson() => json.encode(toMap());
}

class UserVerifiedResponseApi {
  final String token;
  const UserVerifiedResponseApi(this.token);

  factory UserVerifiedResponseApi.fromMap(Map<String, dynamic> data) =>
      UserVerifiedResponseApi(data['accessToken']);
}
