// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: json['id'] as String,
  name: json['name'] as String? ?? '',
  role: json['role'] as String? ?? '',
  description: json['description'] as String? ?? '',
  technologies:
      (json['technologies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  url: json['url'] as String? ?? '',
  githubUrl: json['githubUrl'] as String? ?? '',
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'role': instance.role,
  'description': instance.description,
  'technologies': instance.technologies,
  'url': instance.url,
  'githubUrl': instance.githubUrl,
};
