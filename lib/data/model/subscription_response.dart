import 'dart:convert';

import 'package:otaku_katarougu_app/domain/domain_mapper.dart';
import 'package:otaku_katarougu_app/domain/model/subscription.dart';

class SubscriptionResponse extends DomainMapper<Subscription> {
  final DateTime? endDate;
  final String? price;
  final String? categoryUid;
  final DateTime? startDate;
  final String? uid;
  final String? url;

  SubscriptionResponse(
      {this.endDate,
      this.price,
      this.categoryUid,
      this.startDate,
      this.uid,
      this.url});

  @override
  String toString() {
    return 'SubscriptionResponse(endDate: $endDate, price: $price, categoryUid: $categoryUid, startDate: $startDate)';
  }

  factory SubscriptionResponse.fromMap(Map<String, dynamic> data) {
    return SubscriptionResponse(
      endDate: data['endDate'] == null
          ? null
          : DateTime.parse(data['endDate'] as String),
      price: data['price'] as String?,
      categoryUid: data['categoryUid'] as String?,
      url: data['url'] as String?,
      startDate: data['startDate'] == null
          ? null
          : DateTime.parse(data['startDate'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'endDate': endDate?.toIso8601String(),
        'price': price,
        'categoryUid': categoryUid,
        'startDate': startDate?.toIso8601String(),
        'uid': uid,
        'url': url
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubscriptionResponse].
  factory SubscriptionResponse.fromJson(String data) {
    return SubscriptionResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubscriptionResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  SubscriptionResponse copyWith(
      {DateTime? endDate,
      String? price,
      String? categoryUid,
      DateTime? startDate,
      String? url}) {
    return SubscriptionResponse(
        endDate: endDate ?? this.endDate,
        price: price ?? this.price,
        categoryUid: categoryUid ?? this.categoryUid,
        startDate: startDate ?? this.startDate,
        url: url ?? this.url);
  }

  @override
  Subscription mapToDomain() => Subscription(
        endDate: endDate,
        price: price ?? '',
        categoryUid: categoryUid ?? '',
        startDate: startDate,
        url: url,
      );
}
