import 'package:cv_maker/data/models/models.dart';
import 'package:cv_maker/data/services/ats_score_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('blank resume scores low', () {
    final resume = createBlankResume(name: 'Blank');
    final result = AtsScoreService.score(resume);
    expect(result.score, lessThan(50));
  });

  test('fully populated resume scores 100', () {
    final resume = createBlankResume(name: 'Complete').copyWith(
      personalInfo: const PersonalInfo(fullName: 'Jamie Rivera', email: 'jamie@example.com'),
      summary: 'Experienced engineer.',
      experiences: [
        Experience(id: 'e1', jobTitle: 'Engineer', company: 'Acme', description: 'Did things.'),
      ],
      education: [Education(id: 'ed1', degree: 'B.S.', institution: 'UT')],
      skills: const [Skill(id: 's1', name: 'Flutter')],
    );
    final result = AtsScoreService.score(resume);
    expect(result.score, 100);
  });
}
