// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomSectionItem _$CustomSectionItemFromJson(Map<String, dynamic> json) =>
    _CustomSectionItem(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$CustomSectionItemToJson(_CustomSectionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };

_CustomSection _$CustomSectionFromJson(Map<String, dynamic> json) =>
    _CustomSection(
      id: json['id'] as String,
      title: json['title'] as String? ?? 'Custom Section',
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => CustomSectionItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <CustomSectionItem>[],
    );

Map<String, dynamic> _$CustomSectionToJson(_CustomSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
