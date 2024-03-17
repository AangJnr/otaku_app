import 'package:otaku_katarougu_app/data/model/profile_response/profile_response.dart';
import 'package:otaku_katarougu_app/domain/domain_mapper.dart';

import '../../../config/theme_setup.dart';
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
  final String uid;
  final Socials socials;
  final AppTheme? theme;
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
    this.uid = '',
    this.relevantWorks = const [],
    this.socials = const Socials(),
    this.theme,
  });

 String  get fullName => "$firstName $lastName";

  @override
  String toString() {
    return 'ProfileResponse(firstName: $firstName, lastName: $lastName, bio: $bio, email: $email, phone: $phone, web: $web, headerImage: $headerImage, picture: $picture, pageVisitCount: $pageVisitCount, key: $uid, socials: $socials)';
  }

  bool get isIncompleteProfile =>
      firstName.isEmpty || lastName.isEmpty || bio.isEmpty;

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
      String? uid,
      Socials? socials,
      AppTheme? theme,
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
        uid: uid ?? this.uid,
        socials: socials ?? this.socials,
        theme: theme ?? this.theme,
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
      uid: uid,
      socials: socials.mapToApi());
}
