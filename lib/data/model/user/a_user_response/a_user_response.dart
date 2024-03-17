import 'dart:convert';

import 'package:otaku_katarougu_app/domain/domain_mapper.dart';

import '../../../../domain/model/user.dart';
import '../../profile_response/profile_response.dart';
import 'date_time_response.dart';

class AUserResponse implements DomainMapper<User> {
  final ADateTime? createdAt;
  final String? uid;
  final String? categoryUid;
  final String? activeProfileUid;
  final String? email;
  final String? userName;
  final ADateTime? updatedAt;
  final List<ProfileResponse>? profiles;

  const AUserResponse({
    this.createdAt,
    this.uid,
    this.categoryUid,
    this.activeProfileUid,
    this.email,
    this.userName,
    this.updatedAt,
    this.profiles,
  });

  @override
  String toString() {
    return 'AUserResponse(createdAt: $createdAt, uid: $uid, categoryUid: $categoryUid, activeProfileUid: $activeProfileUid, email: $email, updatedAt: $updatedAt, profiles: $profiles)';
  }

  factory AUserResponse.fromMap(Map<String, dynamic> data) => AUserResponse(
        createdAt: data['createdAt'] == null
            ? null
            : ADateTime.fromMap(data['createdAt'] as Map<String, dynamic>),
        uid: data['uid'] as String?,
        categoryUid: data['categoryUid'] as String?,
        activeProfileUid: data['activeProfileUid'] as String?,
        email: data['email'] as String?,
        userName: data['userName'] as String?,
        updatedAt: data['updatedAt'] == null
            ? null
            : ADateTime.fromMap(data['updatedAt'] as Map<String, dynamic>),
        profiles: (data['profiles'] as List<dynamic>?)
            ?.map((e) => ProfileResponse.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'createdAt': createdAt?.toMap(),
        'uid': uid,
        'categoryUid': categoryUid,
        'activeProfileUid': activeProfileUid,
        'email': email,
        'userName': userName,
        'updatedAt': updatedAt?.toMap(),
        'profiles': profiles?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AUserResponse].
  factory AUserResponse.fromJson(String data) {
    return AUserResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AUserResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  AUserResponse copyWith({
    ADateTime? createdAt,
    String? uid,
    String? categoryUid,
    String? activeProfileUid,
    String? email,
    ADateTime? updatedAt,
    List<ProfileResponse>? profiles,
  }) {
    return AUserResponse(
      createdAt: createdAt ?? this.createdAt,
      uid: uid ?? this.uid,
      categoryUid: categoryUid ?? this.categoryUid,
      activeProfileUid: activeProfileUid ?? this.activeProfileUid,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
      profiles: profiles ?? this.profiles,
    );
  }

  @override
  User mapToDomain() => User(
        createdAt: createdAt?.toDateTime(),
        uid: uid ?? '',
        categoryUid: categoryUid ?? '',
        activeProfileUid: activeProfileUid ?? '',
        email: email ?? '',
        userName: userName ?? '',
        updatedAt: updatedAt?.toDateTime(),
        profiles: profiles?.map((p) => p.mapToDomain()).toList() ?? [],
      );
}
