// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Certification _$CertificationFromJson(Map<String, dynamic> json) =>
    _Certification(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      issuer: json['issuer'] as String? ?? '',
      issueDate: json['issueDate'] == null
          ? null
          : DateTime.parse(json['issueDate'] as String),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      credentialId: json['credentialId'] as String? ?? '',
      credentialUrl: json['credentialUrl'] as String? ?? '',
    );

Map<String, dynamic> _$CertificationToJson(_Certification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'issuer': instance.issuer,
      'issueDate': instance.issueDate?.toIso8601String(),
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'credentialId': instance.credentialId,
      'credentialUrl': instance.credentialUrl,
    };
