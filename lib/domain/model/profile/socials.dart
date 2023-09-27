import 'package:otaku_katarougu_app/data/model/profile_response/socials_response.dart';
import 'package:otaku_katarougu_app/domain/domain_mapper.dart';

class Socials implements DataMapper<SocialsResponse> {
  final String whatsapp;
  final String instagram;
  final String linkedIn;
  final String twitter;
  final String facebook;

  const Socials(
      {this.whatsapp = '',
      this.instagram = '',
      this.linkedIn = '',
      this.twitter = '',
      this.facebook = ''});

  @override
  String toString() {
    return 'Socials(whatsapp: $whatsapp, instagram: $instagram, linkedIn: $linkedIn, twitter: $twitter)';
  }

  Socials copyWith(
      {String? whatsapp,
      String? instagram,
      String? linkedIn,
      String? twitter,
      String? facebook}) {
    return Socials(
        whatsapp: whatsapp ?? this.whatsapp,
        instagram: instagram ?? this.instagram,
        linkedIn: linkedIn ?? this.linkedIn,
        twitter: twitter ?? this.twitter,
        facebook: facebook ?? this.facebook);
  }

  @override
  SocialsResponse mapToApi() => SocialsResponse(
      whatsapp: whatsapp,
      instagram: instagram,
      linkedIn: linkedIn,
      twitter: twitter,
      facebook: facebook);
}
