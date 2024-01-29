import 'package:otaku_katarougu_app/config/theme_setup.dart';
import 'card_type.dart';

class Category {
  final String uid;
  final String name;
  final List<String> features;
  final int amount;
  final String currency;
  final CardType cardType;
  final AppTheme? theme;
  final int durationInDays;
  final String imageUrl;

  const Category({
    this.uid = '',
    this.name = '',
    this.imageUrl = '',
    this.features = const [],
    this.amount = 0,
    this.currency = '',
    this.cardType = const CardType(),
    this.theme,
    this.durationInDays = 0,
  });

  @override
  String toString() {
    return 'CategoryResponse(uid: $uid, name: $name, features: $features, amount: $amount, currency: $currency, cardType: $cardType, theme: $theme, durationInDays: $durationInDays)';
  }

  Category copyWith({
    String? uid,
    String? name,
    List<String>? features,
    int? amount,
    String? currency,
    CardType? cardType,
    AppTheme? theme,
    int? durationInDays,
    String? imageUrl,
  }) {
    return Category(
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
}
