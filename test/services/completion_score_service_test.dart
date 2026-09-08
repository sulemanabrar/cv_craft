import 'package:cv_maker/data/models/models.dart';
import 'package:cv_maker/data/services/completion_score_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('blank resume scores 0', () {
    final resume = createBlankResume(name: 'Blank');
    final result = CompletionScoreService.score(resume);
    expect(result.percent, 0);
  });

  test('adding recommended fields increases the score without penalty', () {
    final base = createBlankResume(name: 'Base');
    final baseScore = CompletionScoreService.score(base).percent;

    final improved = base.copyWith(
      personalInfo: base.personalInfo.copyWith(
        fullName: 'Jamie Rivera',
        email: 'jamie@example.com',
        linkedIn: 'linkedin.com/in/jamie',
      ),
    );
    final improvedScore = CompletionScoreService.score(improved).percent;

    expect(improvedScore, greaterThan(baseScore));
  });
}
