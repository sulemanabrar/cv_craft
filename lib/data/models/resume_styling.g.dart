// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_styling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResumeStyling _$ResumeStylingFromJson(Map<String, dynamic> json) =>
    _ResumeStyling(
      templateId: json['templateId'] as String? ?? 'ats_classic',
      colorPresetId: json['colorPresetId'] as String? ?? 'navy',
      fontFamily: json['fontFamily'] as String? ?? ResumeFontFamilyIds.firaSans,
      fontSizeScale: (json['fontSizeScale'] as num?)?.toDouble() ?? 1.0,
      headingSizeScale: (json['headingSizeScale'] as num?)?.toDouble() ?? 1.0,
      lineSpacingScale: (json['lineSpacingScale'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$ResumeStylingToJson(_ResumeStyling instance) =>
    <String, dynamic>{
      'templateId': instance.templateId,
      'colorPresetId': instance.colorPresetId,
      'fontFamily': instance.fontFamily,
      'fontSizeScale': instance.fontSizeScale,
      'headingSizeScale': instance.headingSizeScale,
      'lineSpacingScale': instance.lineSpacingScale,
    };
