import 'dart:convert';

class AThemeResponse {
  final String? primaryBackgroundColor;
  final String? secondaryBackgroundColor;
  final String? tertiaryBackgroundColor;
  final String? accent;
  final String? primaryTextColor;
  final String? secondaryTextColor;
  final String? tertiaryTextColor;
  final String? panelBackgroundColor;

  const AThemeResponse(
      {this.accent,
      this.primaryTextColor,
      this.secondaryTextColor,
      this.tertiaryTextColor,
      this.primaryBackgroundColor,
      this.secondaryBackgroundColor,
      this.panelBackgroundColor,
      this.tertiaryBackgroundColor});

  @override
  String toString() {
    return 'Theme( accent: $accent, primaryTextColor: $primaryTextColor, secondaryTextColor: $secondaryTextColor, tertiaryTextColor: $tertiaryTextColor)';
  }

  factory AThemeResponse.fromMap(Map<String, dynamic> data) => AThemeResponse(
      accent: data['accent'] as String?,
      primaryTextColor: data['primaryTextColor'] as String?,
      secondaryTextColor: data['secondaryTextColor'] as String?,
      tertiaryTextColor: data['tertiaryTextColor'] as String?,
      primaryBackgroundColor: data['primaryBackgroundColor'] as String?,
      secondaryBackgroundColor: data['secondaryBackgroundColor'] as String?,
      tertiaryBackgroundColor: data['tertiaryBackgroundColor'] as String?,
      panelBackgroundColor: data['panelBackgroundColor'] as String?);

  Map<String, dynamic> toMap() => {
        'accent': accent,
        'primaryTextColor': primaryTextColor,
        'secondaryTextColor': secondaryTextColor,
        'tertiaryTextColor': tertiaryTextColor,
        'primaryBackgroundColor': primaryBackgroundColor,
        'secondaryBackgroundColor': secondaryBackgroundColor,
        'tertiaryBackgroundColor': tertiaryBackgroundColor,
        'panelBackgroundColor': panelBackgroundColor,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ATheme].
  factory AThemeResponse.fromJson(String data) {
    return AThemeResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ATheme] to a JSON string.
  String toJson() => json.encode(toMap());

  AThemeResponse copyWith({
    String? backgroundColor,
    String? accent,
    String? accentAlt,
    String? primaryTextColor,
    String? secondaryTextColor,
    String? tertiaryTextColor,
    String? primaryBackgroundColor,
    String? secondaryBackgroundColor,
    String? tertiaryBackgroundColor,
    String? panelBackgroundColor,
  }) {
    return AThemeResponse(
        accent: accent ?? this.accent,
        primaryTextColor: primaryTextColor ?? this.primaryTextColor,
        secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
        tertiaryTextColor: tertiaryTextColor ?? this.tertiaryTextColor,
        primaryBackgroundColor:
            primaryBackgroundColor ?? this.primaryBackgroundColor,
        secondaryBackgroundColor:
            secondaryBackgroundColor ?? this.secondaryBackgroundColor,
        tertiaryBackgroundColor:
            tertiaryBackgroundColor ?? this.tertiaryBackgroundColor,
        panelBackgroundColor:
            panelBackgroundColor ?? this.panelBackgroundColor);
  }
}
