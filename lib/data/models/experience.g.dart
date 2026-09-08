// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Experience _$ExperienceFromJson(Map<String, dynamic> json) => _Experience(
  id: json['id'] as String,
  jobTitle: json['jobTitle'] as String? ?? '',
  company: json['company'] as String? ?? '',
  location: json['location'] as String? ?? '',
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  isCurrent: json['isCurrent'] as bool? ?? false,
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$ExperienceToJson(_Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobTitle': instance.jobTitle,
      'company': instance.company,
      'location': instance.location,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isCurrent': instance.isCurrent,
      'description': instance.description,
    };
