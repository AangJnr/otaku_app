import 'dart:convert';
import 'package:otaku_katarougu_app/data/model/profile_response/relevant_work_response.dart';
import 'package:otaku_katarougu_app/domain/domain_mapper.dart';
import 'package:otaku_katarougu_app/domain/model/profile/profile.dart';
import 'package:otaku_katarougu_app/domain/model/profile/socials.dart';

import '../../../domain/model/category/category.dart';
import '../category_response/category_response.dart';
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
  final String? userUid;
  final String? key;
  final SocialsResponse? socials;
  final CategoryResponse? category;
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
      this.userUid,
      this.key,
      this.socials,
      this.category,
      this.relevantWorks});

  @override
  String toString() {
    return 'ProfileResponse(firstName: $firstName, lastName: $lastName, bio: $bio, email: $email, phone: $phone, web: $web, headerImage: $headerImage, picture: $picture, pageVisitCount: $pageVisitCount, userUid: $userUid, key: $key, socials: $socials, categoryUid: $category)';
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
      userUid: data['userUid'] as String?,
      key: data['key'] as String?,
      socials: data['socials'] == null
          ? null
          : SocialsResponse.fromMap(data['socials'] as Map<String, dynamic>),
      category: data['category'] == null
          ? null
          : CategoryResponse.fromMap(data['category'] as Map<String, dynamic>),
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
        'userUid': userUid,
        'key': key,
        'socials': socials?.toMap(),
        'category': category?.toMap(),
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
      String? key,
      SocialsResponse? socials,
      CategoryResponse? category,
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
        userUid: userUid ?? this.userUid,
        key: key ?? this.key,
        socials: socials ?? this.socials,
        category: category ?? this.category,
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
      userUid: userUid ?? '',
      key: key ?? '',
      socials: socials?.mapToDomain() ?? const Socials(),
      category: category?.mapToDomain() ?? const Category(),
      relevantWorks: relevantWorks?.map((e) => e.mapToDomain()).toList() ?? []);
}
