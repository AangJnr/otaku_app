import 'dart:convert';

import 'package:otaku_katarougu_app/domain/domain_mapper.dart';
import '../../../config/theme_setup.dart';
import '../../../domain/model/category/card_type.dart';
import '../../../domain/model/category/category.dart';
import 'card_type_response.dart';
import 'theme_response.dart';

class CategoryResponse implements DomainMapper<Category> {
  final String? uid;
  final String? name;
  final List<dynamic>? features;
  final int? amount;
  final String? currency;
  final CardTypeResponse? cardType;
  final AThemeResponse? theme;
  final int? durationInDays;
  final String? imageUrl;

  const CategoryResponse({
    this.uid,
    this.name,
    this.features,
    this.amount,
    this.currency,
    this.cardType,
    this.theme,
    this.durationInDays,
    this.imageUrl,
  });

  @override
  String toString() {
    return 'CategoryResponse(uid: $uid, name: $name, features: $features, amount: $amount, currency: $currency, cardType: $cardType, theme: $theme, durationInDays: $durationInDays)';
  }

  factory CategoryResponse.fromMap(Map<String, dynamic> data) {
    return CategoryResponse(
      uid: data['uid'] as String?,
      name: data['name'] as String?,
      features: data['features'] as List<dynamic>?,
      amount: data['amount'] as int?,
      currency: data['currency'] as String?,
      imageUrl: data['imageUrl'] as String?,
      cardType: data['cardType'] == null
          ? null
          : CardTypeResponse.fromMap(data['cardType'] as Map<String, dynamic>),
      theme: data['theme'] == null
          ? null
          : AThemeResponse.fromMap(data['theme'] as Map<String, dynamic>),
      durationInDays: data['durationInDays'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'features': features,
        'amount': amount,
        'currency': currency,
        'cardType': cardType?.toMap(),
        'theme': theme?.toMap(),
        'durationInDays': durationInDays,
        'imageUrl': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryResponse].
  factory CategoryResponse.fromJson(String data) {
    return CategoryResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  CategoryResponse copyWith(
      {String? uid,
      String? name,
      List<String>? features,
      int? amount,
      String? currency,
      CardTypeResponse? cardType,
      AThemeResponse? theme,
      int? durationInDays,
      String? imageUrl}) {
    return CategoryResponse(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      features: features ?? this.features,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      cardType: cardType ?? this.cardType,
      theme: theme ?? this.theme,
      imageUrl: imageUrl ?? this.imageUrl,
      durationInDays: durationInDays ?? this.durationInDays,
    );
  }

  @override
  Category mapToDomain() => Category(
      uid: uid ?? '',
      name: name ?? '',
      features: features?.map((e) => e.toString()).toList() ?? [],
      amount: amount ?? 0,
      currency: currency ?? '',
      cardType: cardType?.mapToDomain() ?? const CardType(),
      durationInDays: durationInDays ?? 0,
      theme: theme == null ? GoldTheme() : GenericTheme.fromTheme(theme!));
}
