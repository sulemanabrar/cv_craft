import 'package:freezed_annotation/freezed_annotation.dart';

import 'achievement.dart';
import 'award.dart';
import 'certification.dart';
import 'custom_section.dart';
import 'education.dart';
import 'experience.dart';
import 'interest.dart';
import 'language_entry.dart';
import 'personal_info.dart';
import 'project.dart';
import 'publication.dart';
import 'reference_entry.dart';
import 'resume_styling.dart';
import 'skill.dart';
import 'volunteer_experience.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

/// The single normalized resume data model every template renders from.
/// Changing `styling.templateId` must never touch any field below it —
/// switching templates only ever changes presentation.
@freezed
abstract class Resume with _$Resume {
  const factory Resume({
    required String id,
    required String name,
    @Default(PersonalInfo()) PersonalInfo personalInfo,
    @Default('') String summary,
    @Default(<Experience>[]) List<Experience> experiences,
    @Default(<Education>[]) List<Education> education,
    @Default(<Skill>[]) List<Skill> skills,
    @Default(<Project>[]) List<Project> projects,
    @Default(<Certification>[]) List<Certification> certifications,
    @Default(<LanguageEntry>[]) List<LanguageEntry> languages,
    @Default(<Award>[]) List<Award> awards,
    @Default(<Achievement>[]) List<Achievement> achievements,
    @Default(<Publication>[]) List<Publication> publications,
    @Default(<VolunteerExperience>[])
    List<VolunteerExperience> volunteerExperience,
    @Default(<ReferenceEntry>[]) List<ReferenceEntry> references,
    @Default(<Interest>[]) List<Interest> interests,
    @Default(<CustomSection>[]) List<CustomSection> customSections,
    @Default(<String>[]) List<String> sectionOrder,
    @Default(<String>{}) Set<String> enabledOptionalSections,
    @Default(ResumeStyling()) ResumeStyling styling,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Resume;

  factory Resume.fromJson(Map<String, dynamic> json) =>
      _$ResumeFromJson(json);
}
