// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Skill _$SkillFromJson(Map<String, dynamic> json) => _Skill(
  id: json['id'] as String,
  name: json['name'] as String,
  group: json['group'] as String? ?? 'Technical Skills',
  level: $enumDecodeNullable(_$SkillLevelEnumMap, json['level']),
);

Map<String, dynamic> _$SkillToJson(_Skill instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'group': instance.group,
  'level': _$SkillLevelEnumMap[instance.level],
};

const _$SkillLevelEnumMap = {
  SkillLevel.beginner: 'beginner',
  SkillLevel.intermediate: 'intermediate',
  SkillLevel.advanced: 'advanced',
  SkillLevel.expert: 'expert',
};
