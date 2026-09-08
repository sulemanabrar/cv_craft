// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resume _$ResumeFromJson(Map<String, dynamic> json) => _Resume(
  id: json['id'] as String,
  name: json['name'] as String,
  personalInfo: json['personalInfo'] == null
      ? const PersonalInfo()
      : PersonalInfo.fromJson(json['personalInfo'] as Map<String, dynamic>),
  summary: json['summary'] as String? ?? '',
  experiences:
      (json['experiences'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Experience>[],
  education:
      (json['education'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Education>[],
  skills:
      (json['skills'] as List<dynamic>?)
          ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Skill>[],
  projects:
      (json['projects'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Project>[],
  certifications:
      (json['certifications'] as List<dynamic>?)
          ?.map((e) => Certification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Certification>[],
  languages:
      (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LanguageEntry>[],
  awards:
      (json['awards'] as List<dynamic>?)
          ?.map((e) => Award.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Award>[],
  achievements:
      (json['achievements'] as List<dynamic>?)
          ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Achievement>[],
  publications:
      (json['publications'] as List<dynamic>?)
          ?.map((e) => Publication.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Publication>[],
  volunteerExperience:
      (json['volunteerExperience'] as List<dynamic>?)
          ?.map((e) => VolunteerExperience.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <VolunteerExperience>[],
  references:
      (json['references'] as List<dynamic>?)
          ?.map((e) => ReferenceEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ReferenceEntry>[],
  interests:
      (json['interests'] as List<dynamic>?)
          ?.map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Interest>[],
  customSections:
      (json['customSections'] as List<dynamic>?)
          ?.map((e) => CustomSection.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CustomSection>[],
  sectionOrder:
      (json['sectionOrder'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  enabledOptionalSections:
      (json['enabledOptionalSections'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  styling: json['styling'] == null
      ? const ResumeStyling()
      : ResumeStyling.fromJson(json['styling'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ResumeToJson(_Resume instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'personalInfo': instance.personalInfo.toJson(),
  'summary': instance.summary,
  'experiences': instance.experiences.map((e) => e.toJson()).toList(),
  'education': instance.education.map((e) => e.toJson()).toList(),
  'skills': instance.skills.map((e) => e.toJson()).toList(),
  'projects': instance.projects.map((e) => e.toJson()).toList(),
  'certifications': instance.certifications.map((e) => e.toJson()).toList(),
  'languages': instance.languages.map((e) => e.toJson()).toList(),
  'awards': instance.awards.map((e) => e.toJson()).toList(),
  'achievements': instance.achievements.map((e) => e.toJson()).toList(),
  'publications': instance.publications.map((e) => e.toJson()).toList(),
  'volunteerExperience': instance.volunteerExperience
      .map((e) => e.toJson())
      .toList(),
  'references': instance.references.map((e) => e.toJson()).toList(),
  'interests': instance.interests.map((e) => e.toJson()).toList(),
  'customSections': instance.customSections.map((e) => e.toJson()).toList(),
  'sectionOrder': instance.sectionOrder,
  'enabledOptionalSections': instance.enabledOptionalSections.toList(),
  'styling': instance.styling.toJson(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
