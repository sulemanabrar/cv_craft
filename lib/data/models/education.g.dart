// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Education _$EducationFromJson(Map<String, dynamic> json) => _Education(
  id: json['id'] as String,
  degree: json['degree'] as String? ?? '',
  institution: json['institution'] as String? ?? '',
  location: json['location'] as String? ?? '',
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  isCurrent: json['isCurrent'] as bool? ?? false,
  gradeOrGpa: json['gradeOrGpa'] as String? ?? '',
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$EducationToJson(_Education instance) =>
    <String, dynamic>{
      'id': instance.id,
      'degree': instance.degree,
      'institution': instance.institution,
      'location': instance.location,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isCurrent': instance.isCurrent,
      'gradeOrGpa': instance.gradeOrGpa,
      'description': instance.description,
    };
