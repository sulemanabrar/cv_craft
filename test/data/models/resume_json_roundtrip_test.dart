import 'package:cv_maker/core/utils/hive_json_cast.dart';
import 'package:cv_maker/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

/// Simulates what Hive actually returns on read: `Map<dynamic, dynamic>` and
/// `List<dynamic>` all the way down, instead of the `Map<String, dynamic>`
/// that `toJson()` produces. This is the exact shape `deepCastToStringKeyedMap`
/// must handle before handing data to `Resume.fromJson`.
dynamic simulateHiveDynamicRoundTrip(dynamic value) {
  if (value is Map) {
    final map = <dynamic, dynamic>{};
    value.forEach((key, val) {
      map[key] = simulateHiveDynamicRoundTrip(val);
    });
    return map;
  }
  if (value is List) {
    return value.map(simulateHiveDynamicRoundTrip).toList();
  }
  return value;
}

void main() {
  test('Resume round-trips through toJson -> Hive-shaped map -> fromJson', () {
    final original = Resume(
      id: 'r1',
      name: 'Software Engineer CV',
      personalInfo: const PersonalInfo(
        fullName: 'Jamie Rivera',
        professionalTitle: 'Senior Flutter Engineer',
        email: 'jamie@example.com',
        phone: '+1 555 0100',
        location: 'Austin, TX',
        linkedIn: 'linkedin.com/in/jamie',
        portfolio: 'jamie.dev',
        github: 'github.com/jamie',
        website: 'jamie.dev',
      ),
      summary: 'Flutter engineer with 6 years of experience.',
      experiences: [
        Experience(
          id: 'e1',
          jobTitle: 'Senior Flutter Engineer',
          company: 'Acme Corp',
          location: 'Remote',
          startDate: DateTime(2021, 3, 1),
          isCurrent: true,
          description: 'Led the mobile platform team.\nShipped v2 rewrite.',
        ),
      ],
      education: [
        Education(
          id: 'ed1',
          degree: 'B.S. Computer Science',
          institution: 'UT Austin',
          startDate: DateTime(2013, 8, 1),
          endDate: DateTime(2017, 5, 1),
          gradeOrGpa: '3.8',
        ),
      ],
      skills: const [
        Skill(id: 's1', name: 'Flutter', group: 'Frameworks', level: SkillLevel.expert),
        Skill(id: 's2', name: 'Dart', group: 'Technical Skills'),
      ],
      projects: [
        Project(
          id: 'p1',
          name: 'CV Maker',
          role: 'Lead Developer',
          description: 'A premium resume builder.',
          technologies: const ['Flutter', 'Riverpod'],
          url: 'cvmaker.app',
          githubUrl: 'github.com/jamie/cv_maker',
        ),
      ],
      certifications: [
        Certification(
          id: 'c1',
          name: 'AWS Certified Developer',
          issuer: 'Amazon',
          issueDate: DateTime(2022, 1, 1),
        ),
      ],
      languages: const [
        LanguageEntry(id: 'l1', name: 'English', proficiency: 'Native'),
      ],
      awards: [
        Award(id: 'aw1', title: 'Hackathon Winner', issuer: 'TechConf', date: DateTime(2020, 6, 1)),
      ],
      achievements: [
        Achievement(id: 'ac1', title: 'Reduced app startup time by 40%'),
      ],
      publications: [
        Publication(id: 'pub1', title: 'Scaling Flutter Apps', publisher: 'Medium'),
      ],
      volunteerExperience: [
        VolunteerExperience(id: 'v1', role: 'Mentor', organization: 'Code.org'),
      ],
      references: const [
        ReferenceEntry(id: 'ref1', name: 'Alex Chen', relationship: 'Manager', company: 'Acme Corp'),
      ],
      interests: const [Interest(id: 'i1', name: 'Rock climbing')],
      customSections: [
        CustomSection(
          id: 'cs1',
          title: 'Speaking Engagements',
          items: [
            CustomSectionItem(id: 'csi1', title: 'FlutterConf 2023', description: 'Keynote speaker'),
          ],
        ),
      ],
      sectionOrder: defaultSectionOrder,
      enabledOptionalSections: const {'certifications', 'languages'},
      styling: const ResumeStyling(templateId: 'modern', colorPresetId: 'burgundy'),
      createdAt: DateTime(2024, 1, 1, 12),
      updatedAt: DateTime(2024, 6, 15, 9, 30),
    );

    final json = original.toJson();
    final hiveShaped = simulateHiveDynamicRoundTrip(json);
    final casted = deepCastToStringKeyedMap(hiveShaped);
    final restored = Resume.fromJson(casted);

    expect(restored, equals(original));
  });
}
