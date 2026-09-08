// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) =>
    _PersonalInfo(
      fullName: json['fullName'] as String? ?? '',
      professionalTitle: json['professionalTitle'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      location: json['location'] as String? ?? '',
      linkedIn: json['linkedIn'] as String? ?? '',
      portfolio: json['portfolio'] as String? ?? '',
      github: json['github'] as String? ?? '',
      website: json['website'] as String? ?? '',
    );

Map<String, dynamic> _$PersonalInfoToJson(_PersonalInfo instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'professionalTitle': instance.professionalTitle,
      'email': instance.email,
      'phone': instance.phone,
      'location': instance.location,
      'linkedIn': instance.linkedIn,
      'portfolio': instance.portfolio,
      'github': instance.github,
      'website': instance.website,
    };
