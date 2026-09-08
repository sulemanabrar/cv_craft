// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LanguageEntry _$LanguageEntryFromJson(Map<String, dynamic> json) =>
    _LanguageEntry(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      proficiency: json['proficiency'] as String? ?? 'Conversational',
    );

Map<String, dynamic> _$LanguageEntryToJson(_LanguageEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'proficiency': instance.proficiency,
    };
