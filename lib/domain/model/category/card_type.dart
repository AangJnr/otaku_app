
class CardType {
	final String  colorName;
	final bool  nfcEnabled;

	const CardType({this.colorName = '', this.nfcEnabled = false});

	@override
	String toString() {
		return 'CardType(colorName: $colorName, nfcEnabled: $nfcEnabled)';
	}

	CardType copyWith({
		String? colorName,
		bool? nfcEnabled,
	}) {
		return CardType(
			colorName: colorName ?? this.colorName,
			nfcEnabled: nfcEnabled ?? this.nfcEnabled,
		);
	}
}
