/// Every resume section that can appear in a rendered CV, keyed by a stable
/// string id used inside `Resume.sectionOrder`. Personal Information is
/// intentionally excluded — it's always rendered as the fixed header, never
/// reordered or disabled.
enum ResumeSectionType {
  summary('summary', 'Professional Summary'),
  experience('experience', 'Work Experience'),
  education('education', 'Education'),
  skills('skills', 'Skills'),
  projects('projects', 'Projects'),
  certifications('certifications', 'Certifications'),
  languages('languages', 'Languages'),
  awards('awards', 'Awards'),
  achievements('achievements', 'Achievements'),
  publications('publications', 'Publications'),
  volunteerExperience('volunteerExperience', 'Volunteer Experience'),
  references('references', 'References'),
  interests('interests', 'Interests');

  const ResumeSectionType(this.key, this.label);

  final String key;
  final String label;

  static ResumeSectionType? fromKey(String key) {
    for (final type in values) {
      if (type.key == key) return type;
    }
    return null;
  }
}

/// Sections that are always present and cannot be disabled by the user.
const Set<ResumeSectionType> coreSectionTypes = {
  ResumeSectionType.summary,
  ResumeSectionType.experience,
  ResumeSectionType.education,
  ResumeSectionType.skills,
  ResumeSectionType.projects,
};

/// Sections the user can toggle on/off via the "Manage Sections" sheet.
const Set<ResumeSectionType> optionalSectionTypes = {
  ResumeSectionType.certifications,
  ResumeSectionType.languages,
  ResumeSectionType.awards,
  ResumeSectionType.achievements,
  ResumeSectionType.publications,
  ResumeSectionType.volunteerExperience,
  ResumeSectionType.references,
  ResumeSectionType.interests,
};

/// Prefix used to build a synthetic `sectionOrder` key for a user-defined
/// custom section, e.g. `custom_<id>`.
const String customSectionKeyPrefix = 'custom_';

String customSectionKey(String customSectionId) =>
    '$customSectionKeyPrefix$customSectionId';

bool isCustomSectionKey(String key) => key.startsWith(customSectionKeyPrefix);

String customSectionIdFromKey(String key) =>
    key.substring(customSectionKeyPrefix.length);
