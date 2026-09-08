// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerExperience _$VolunteerExperienceFromJson(Map<String, dynamic> json) =>
    _VolunteerExperience(
      id: json['id'] as String,
      role: json['role'] as String? ?? '',
      organization: json['organization'] as String? ?? '',
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

Map<String, dynamic> _$VolunteerExperienceToJson(
  _VolunteerExperience instance,
) => <String, dynamic>{
  'id': instance.id,
  'role': instance.role,
  'organization': instance.organization,
  'location': instance.location,
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'isCurrent': instance.isCurrent,
  'description': instance.description,
};
