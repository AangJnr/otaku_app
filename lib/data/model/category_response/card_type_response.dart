import 'dart:convert';

import 'package:otaku_katarougu_app/domain/domain_mapper.dart';

import '../../../domain/model/category/card_type.dart';




class CardTypeResponse implements DomainMapper<CardType>{
	final String? colorName;
	final bool? nfcEnabled;

	const CardTypeResponse({this.colorName, this.nfcEnabled});

	@override
	String toString() {
		return 'CardType(colorName: $colorName, nfcEnabled: $nfcEnabled)';
	}

	factory CardTypeResponse.fromMap(Map<String, dynamic> data) => CardTypeResponse(
				colorName: data['colorName'] as String?,
				nfcEnabled: data['nfcEnabled'] as bool?,
			);

	Map<String, dynamic> toMap() => {
				'colorName': colorName,
				'nfcEnabled': nfcEnabled,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CardType].
	factory CardTypeResponse.fromJson(String data) {
		return CardTypeResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CardType] to a JSON string.
	String toJson() => json.encode(toMap());

	CardTypeResponse copyWith({
		String? colorName,
		bool? nfcEnabled,
	}) {
		return CardTypeResponse(
			colorName: colorName ?? this.colorName,
			nfcEnabled: nfcEnabled ?? this.nfcEnabled,
		);
	}

  @override
  CardType mapToDomain() => CardType(colorName: colorName??'', nfcEnabled: nfcEnabled??false);
}
