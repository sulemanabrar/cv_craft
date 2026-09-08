import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.freezed.dart';
part 'skill.g.dart';

/// Optional — visual skill-level indicators can reduce ATS friendliness, so
/// this is never required.
enum SkillLevel { beginner, intermediate, advanced, expert }

@freezed
abstract class Skill with _$Skill {
  const factory Skill({
    required String id,
    required String name,
    @Default('Technical Skills') String group,
    SkillLevel? level,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}
