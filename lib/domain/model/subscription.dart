import 'dart:convert';

class Subscription {
  final DateTime? endDate;
  final String price;
  final String categoryUid;
  final DateTime? startDate;
  final String uid;
  final String? email;
  final String? url;

  const Subscription(
      {this.endDate,
      this.price = '',
      this.categoryUid = '',
      this.startDate, this.email, this.url,
      this.uid = ''});

  @override
  String toString() {
    return 'SubscriptionResponse(endDate: $endDate, price: $price, categoryUid: $categoryUid, startDate: $startDate)';
  }

  Subscription copyWith({
    DateTime? endDate,
    String? price,
    String? categoryUid,  String? email,
    DateTime? startDate,String? url,
  }) {
    return Subscription(
      endDate: endDate ?? this.endDate,
      price: price ?? this.price,
      categoryUid: categoryUid ?? this.categoryUid,
      startDate: startDate ?? this.startDate,email:email??this.email,
      url:url??this.url
    );
  }

  String toRequest() => json.encode({'categoryUid': categoryUid, 'uid': uid});
}

class SubscriptionRequest {
  final String categoryUid;
  final String email;
  const SubscriptionRequest({required this.categoryUid, required this.email});

  String toRequest() => json.encode({'categoryUid': categoryUid, 'email': email});

  String toCreateAccountRequest() => json.encode({'categoryUid': categoryUid, 'email': email});

}
