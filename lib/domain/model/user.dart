import 'package:otaku_katarougu_app/data/model/user/a_user_response/date_time_response.dart';

import '../../data/model/user/a_user_response/a_user_response.dart';
import '../domain_mapper.dart';
import 'profile/profile.dart';

class User implements DataMapper<AUserResponse> {
  final DateTime? createdAt;
  final String uid;
  final String categoryUid;
  final String activeProfileUid;
  final String email;
    final String userName;

  final DateTime? updatedAt;
  final List<Profile> profiles;

  const User(
      {this.createdAt,
      this.uid = '-1', this.userName = '',
      this.categoryUid = '',
      this.activeProfileUid = '',
      this.email = '',
      this.updatedAt,
      this.profiles = const []});

  bool get isValid => uid.isNotEmpty;

  String get totalVisitCounts => profiles.fold(0, (value, element) => value + element.pageVisitCount).toString();

  @override
  String toString() {
    return 'AUserResponse(createdAt: $createdAt, uid: $uid, categoryUid: $categoryUid, activeProfileUid: $activeProfileUid, email: $email, updatedAt: $updatedAt, profiles: $profiles)';
  }

  User copyWith({
    DateTime? createdAt,
    String? uid,
    String? categoryUid,
    String? activeProfileUid,
    String? email,
    DateTime? updatedAt,
    List<Profile>? profiles, String? userName,
  }) {
    return User(
      createdAt: createdAt ?? this.createdAt,
      uid: uid ?? this.uid,
      userName : userName ??this.userName,
      categoryUid: categoryUid ?? this.categoryUid,
      activeProfileUid: activeProfileUid ?? this.activeProfileUid,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
      profiles: profiles ?? this.profiles,
    );
  }

  @override
  AUserResponse mapToApi() {
    ADateTime? created;
    ADateTime? updated;

    try {
      final createdAtMicrosecondsSinceEpoch =
          createdAt?.microsecondsSinceEpoch ?? 0;
      created = ADateTime(
        seconds: createdAtMicrosecondsSinceEpoch ~/ 1000000,
        nanoseconds: (createdAtMicrosecondsSinceEpoch % 1000000) * 1000,
      );

      final updatedAtMicrosecondsSinceEpoch =
          createdAt?.microsecondsSinceEpoch ?? 0;

      updated = ADateTime(
        seconds: updatedAtMicrosecondsSinceEpoch ~/ 1000000,
        nanoseconds: (updatedAtMicrosecondsSinceEpoch % 1000000) * 1000,
      );
    } catch (e) {
      //
    }
    return AUserResponse(
      createdAt: created,
      uid: uid,
      categoryUid: categoryUid,
      activeProfileUid: activeProfileUid,
      email: email,
      userName:userName,
      updatedAt: updated,
      profiles: profiles?.map((p) => p.mapToApi()).toList() ?? [],
    );
  }
}
