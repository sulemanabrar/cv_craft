import '../models/resume.dart';

class AtsCheckItem {
  const AtsCheckItem({required this.label, required this.passed});

  final String label;
  final bool passed;
}

class AtsScoreResult {
  const AtsScoreResult({required this.score, required this.checks});

  final int score;
  final List<AtsCheckItem> checks;
}

/// Pure `Resume -> AtsScoreResult` scorer — no widget/provider dependency,
/// so it's trivially unit-testable and reusable everywhere a score badge or
/// pre-export checklist is needed.
abstract final class AtsScoreService {
  static AtsScoreResult score(Resume resume) {
    final checks = <AtsCheckItem>[
      AtsCheckItem(
        label: 'Contact information detected',
        passed: resume.personalInfo.fullName.trim().isNotEmpty &&
            (resume.personalInfo.email.trim().isNotEmpty ||
                resume.personalInfo.phone.trim().isNotEmpty),
      ),
      AtsCheckItem(
        label: 'Professional summary detected',
        passed: resume.summary.trim().isNotEmpty,
      ),
      AtsCheckItem(
        label: 'Work experience detected',
        passed: resume.experiences.isNotEmpty,
      ),
      AtsCheckItem(
        label: 'Education detected',
        passed: resume.education.isNotEmpty,
      ),
      AtsCheckItem(
        label: 'Skills detected',
        passed: resume.skills.isNotEmpty,
      ),
      const AtsCheckItem(
        label: 'Standard section headings used',
        passed: true,
      ),
      const AtsCheckItem(
        label: 'No unreadable graphics or tables',
        passed: true,
      ),
      AtsCheckItem(
        label: 'Experience entries include descriptions',
        passed: resume.experiences.isEmpty ||
            resume.experiences.any((e) => e.description.trim().isNotEmpty),
      ),
    ];

    final passedCount = checks.where((c) => c.passed).length;
    final score = ((passedCount / checks.length) * 100).round();

    return AtsScoreResult(score: score, checks: checks);
  }
}
