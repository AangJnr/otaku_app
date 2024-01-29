import 'dart:convert';

class ADateTime {
  final int seconds;
  final int nanoseconds;

  const ADateTime({this.seconds = 0, this.nanoseconds = 0});

  @override
  String toString() {
    return 'ADateTime(seconds: $seconds, nanoseconds: $nanoseconds)';
  }

  factory ADateTime.fromMap(Map<String, dynamic> data) => ADateTime(
        seconds: data['_seconds'] as int? ?? 0,
        nanoseconds: data['_nanoseconds'] as int? ?? 0,
      );

  Map<String, dynamic> toMap() => {
        '_seconds': seconds,
        '_nanoseconds': nanoseconds,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ADateTime].
  factory ADateTime.fromJson(String data) {
    return ADateTime.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ADateTime] to a JSON string.
  String toJson() => json.encode(toMap());

  ADateTime copyWith({
    int? seconds,
    int? nanoseconds,
  }) {
    return ADateTime(
      seconds: seconds ?? this.seconds,
      nanoseconds: nanoseconds ?? this.nanoseconds,
    );
  }

  DateTime? toDateTime() => DateTime.fromMicrosecondsSinceEpoch(
        seconds * 1000000 + nanoseconds ~/ 1000,
        isUtc: true,
      );
}
