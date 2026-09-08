// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Award _$AwardFromJson(Map<String, dynamic> json) => _Award(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  issuer: json['issuer'] as String? ?? '',
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$AwardToJson(_Award instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'issuer': instance.issuer,
  'date': instance.date?.toIso8601String(),
  'description': instance.description,
};
