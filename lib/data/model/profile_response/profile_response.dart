import 'dart:convert';
import 'package:otaku_katarougu_app/config/theme_setup.dart';
import 'package:otaku_katarougu_app/data/model/category_response/theme_response.dart';
import 'package:otaku_katarougu_app/data/model/profile_response/relevant_work_response.dart';
import 'package:otaku_katarougu_app/domain/domain_mapper.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';
import 'package:otaku_katarougu_app/domain/model/profile/socials.dart';
import 'socials_response.dart';

class ProfileResponse implements DomainMapper<Profile> {
  final String? firstName;
  final String? lastName;
  final String? bio;
  final String? email;
  final String? phone;
  final String? web;
  final String? headerImage;
  final String? picture;
  final int? pageVisitCount;
  final String? uid;
  final SocialsResponse? socials;
  final AThemeResponse? theme;
  final List<RelevantWorkResponse>? relevantWorks;

  const ProfileResponse(
      {this.firstName,
      this.lastName,
      this.bio,
      this.email,
      this.phone,
      this.web,
      this.headerImage,
      this.picture,
      this.pageVisitCount,
      this.uid,
      this.socials,
      this.theme,
      this.relevantWorks});

  @override
  String toString() {
    return 'ProfileResponse(firstName: $firstName, lastName: $lastName, bio: $bio, email: $email, phone: $phone, web: $web, headerImage: $headerImage, picture: $picture, pageVisitCount: $pageVisitCount,  key: $uid, socials: $socials)';
  }

  factory ProfileResponse.fromMap(Map<String, dynamic> data) {
    return ProfileResponse(
      firstName: data['firstName'] as String?,
      lastName: data['lastName'] as String?,
      bio: data['bio'] as String?,
      email: data['email'] as String?,
      phone: data['phone'] as String?,
      web: data['web'] as String?,
      headerImage: data['headerImage'] as String?,
      picture: data['picture'] as String?,
      pageVisitCount: data['pageVisitCount'] as int?,
      uid: data['uid'] as String?,
      socials: data['socials'] == null
          ? null
          : SocialsResponse.fromMap(data['socials'] as Map<String, dynamic>),
      theme: data['theme'] == null
          ? null
          : AThemeResponse.fromMap(data['theme'] as Map<String, dynamic>),
      relevantWorks: data['relevantWorks'] == null
          ? []
          : (data['relevantWorks'] as List<dynamic>)
              .map((e) => RelevantWorkResponse.fromMap(e))
              .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'bio': bio,
        'email': email,
        'phone': phone,
        'web': web,
        'headerImage': headerImage,
        'picture': picture,
        'pageVisitCount': pageVisitCount,
        'key': uid,
        'socials': socials?.toMap(),
        'category': theme?.toMap(),
        'relevantWorks': relevantWorks?.map((e) => e.toMap()).toList()
      };

  List<Map<String, dynamic>> toRequest() =>
      relevantWorks?.map((e) => e.toMap()).toList() ?? [];

  Map<String, dynamic> toRelevantWorksRequest() => {
        'socials': socials?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileResponse].
  factory ProfileResponse.fromJson(String data) {
    return ProfileResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  ProfileResponse copyWith(
      {String? firstName,
      String? lastName,
      String? bio,
      String? email,
      String? phone,
      String? web,
      String? headerImage,
      String? picture,
      int? pageVisitCount,
      String? userUid,
      String? uid,
      SocialsResponse? socials,
      AThemeResponse? theme,
      List<RelevantWorkResponse>? relevantWorks}) {
    return ProfileResponse(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        bio: bio ?? this.bio,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        web: web ?? this.web,
        headerImage: headerImage ?? this.headerImage,
        picture: picture ?? this.picture,
        pageVisitCount: pageVisitCount ?? this.pageVisitCount,
        uid: uid ?? this.uid,
        socials: socials ?? this.socials,
        theme: theme ?? this.theme,
        relevantWorks: relevantWorks ?? this.relevantWorks);
  }

  @override
  Profile mapToDomain() => Profile(
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      bio: bio ?? '',
      email: email ?? '',
      phone: phone ?? '',
      web: web ?? '',
      headerImage: headerImage ?? '',
      picture: picture ?? '',
      pageVisitCount: pageVisitCount ?? 0,
      uid: uid ?? '',
      socials: socials?.mapToDomain() ?? const Socials(),
      theme: theme == null ? SilverTheme() : GenericTheme.fromTheme(theme!),
      relevantWorks: relevantWorks?.map((e) => e.mapToDomain()).toList() ?? []);
}
