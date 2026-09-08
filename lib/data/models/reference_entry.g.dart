// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferenceEntry _$ReferenceEntryFromJson(Map<String, dynamic> json) =>
    _ReferenceEntry(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      relationship: json['relationship'] as String? ?? '',
      company: json['company'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );

Map<String, dynamic> _$ReferenceEntryToJson(_ReferenceEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'relationship': instance.relationship,
      'company': instance.company,
      'email': instance.email,
      'phone': instance.phone,
    };
