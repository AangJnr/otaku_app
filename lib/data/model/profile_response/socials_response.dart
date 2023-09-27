import 'dart:convert';

import 'package:otaku_katarougu_app/domain/domain_mapper.dart';
import 'package:otaku_katarougu_app/domain/model/profile/socials.dart';

class SocialsResponse implements DomainMapper<Socials> {
  final String? whatsapp;
  final String? instagram;
  final String? linkedIn;
  final String? twitter;
  final String? facebook;

  const SocialsResponse(
      {this.whatsapp,
      this.instagram,
      this.linkedIn,
      this.twitter,
      this.facebook});

  @override
  String toString() {
    return 'Socials(whatsapp: $whatsapp, instagram: $instagram, linkedIn: $linkedIn, twitter: $twitter)';
  }

  factory SocialsResponse.fromMap(Map<String, dynamic> data) => SocialsResponse(
        whatsapp: data['whatsapp'] as String?,
        instagram: data['instagram'] as String?,
        linkedIn: data['linkedIn'] as String?,
        twitter: data['twitter'] as String?,
        facebook: data['facebook'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'whatsapp': whatsapp,
        'instagram': instagram,
        'linkedIn': linkedIn,
        'twitter': twitter,
        'facebook': facebook
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SocialsResponse].
  factory SocialsResponse.fromJson(String data) {
    return SocialsResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SocialsResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  Socials mapToDomain() => Socials(
      whatsapp: whatsapp ?? '',
      instagram: instagram ?? '',
      linkedIn: linkedIn ?? '',
      twitter: twitter ?? '',
      facebook: facebook ?? '');
}
