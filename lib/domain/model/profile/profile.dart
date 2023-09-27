import 'package:otaku_katarougu_app/data/model/profile_response/profile_response.dart';
import 'package:otaku_katarougu_app/domain/domain_mapper.dart';

import '../category/category.dart';
import 'relevant_work.dart';
import 'socials.dart';

class Profile implements DataMapper<ProfileResponse> {
  final String firstName;
  final String lastName;
  final String bio;
  final String email;
  final String phone;
  final String web;
  final String headerImage;
  final String picture;
  final int pageVisitCount;
  final String userUid;
  final String key;
  final Socials socials;
  final Category category;
  final List<RelevantWork> relevantWorks;

  const Profile({
    this.firstName = '',
    this.lastName = '',
    this.bio = '',
    this.email = '',
    this.phone = '',
    this.web = '',
    this.headerImage = '',
    this.picture = '',
    this.pageVisitCount = 0,
    this.userUid = '',
    this.key = '',
    this.relevantWorks = const [],
    this.socials = const Socials(),
    this.category = const Category(),
  });

  @override
  String toString() {
    return 'ProfileResponse(firstName: $firstName, lastName: $lastName, bio: $bio, email: $email, phone: $phone, web: $web, headerImage: $headerImage, picture: $picture, pageVisitCount: $pageVisitCount, userUid: $userUid, key: $key, socials: $socials, categoryUid: $category)';
  }

  Profile copyWith(
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
      Socials? socials,
      Category? category,
      List<RelevantWork>? relevantWorks}) {
    return Profile(
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
  ProfileResponse mapToApi() => ProfileResponse(
      firstName: firstName,
      lastName: lastName,
      bio: bio,
      email: email,
      phone: phone,
      web: web,
      headerImage: headerImage,
      picture: picture,
      pageVisitCount: pageVisitCount,
      userUid: userUid,
      key: key,
      socials: socials.mapToApi());
}
