import 'dart:convert';
import 'package:otaku_katarougu_app/domain/domain_mapper.dart';
import '../../../domain/model/profile/relevant_work.dart';

class RelevantWorkResponse implements DomainMapper<RelevantWork> {
  final String? title;
  final String? role;
  final String? description;
  final String? startDate;
  final String? endDate;
  final bool isCurrentRole;

  const RelevantWorkResponse({
    this.title,
    this.role,
    this.description,
    this.startDate,
    this.endDate,
    this.isCurrentRole = false,
  });

  factory RelevantWorkResponse.fromMap(Map<String, dynamic> data) =>
      RelevantWorkResponse(
        title: data['title'] as String?,
        role: data['role'] as String?,
        description: data['description'] as String?,
        startDate: data['startDate'] as String?,
        endDate: data['endDate'] as String?,
        isCurrentRole: data['isCurrentRole'] as bool? ?? false,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'role': role,
        'description': description,
        'startDate': startDate,
        'endDate': endDate,
        'isCurrentRole': isCurrentRole,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SocialsResponse].
  factory RelevantWorkResponse.fromJson(String data) {
    return RelevantWorkResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SocialsResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  RelevantWork mapToDomain() => RelevantWork(
      title: title ?? '',
      role: role ?? '',
      description: description ?? '',
      startDate: startDate,
      endDate: endDate,
      isCurrentRole: isCurrentRole);
}
