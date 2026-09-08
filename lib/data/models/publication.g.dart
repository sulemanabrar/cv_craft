// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Publication _$PublicationFromJson(Map<String, dynamic> json) => _Publication(
  id: json['id'] as String,
  title: json['title'] as String? ?? '',
  publisher: json['publisher'] as String? ?? '',
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  url: json['url'] as String? ?? '',
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$PublicationToJson(_Publication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publisher': instance.publisher,
      'date': instance.date?.toIso8601String(),
      'url': instance.url,
      'description': instance.description,
    };
