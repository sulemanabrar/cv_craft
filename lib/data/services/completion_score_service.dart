import '../models/resume.dart';

class CompletionCheckItem {
  const CompletionCheckItem({
    required this.label,
    required this.passed,
    required this.isRecommendation,
  });

  final String label;
  final bool passed;

  /// True for "nice to have" items (rendered with a warning icon rather than
  /// a hard requirement) — e.g. "Add LinkedIn profile".
  final bool isRecommendation;
}

class CompletionScoreResult {
  const CompletionScoreResult({required this.percent, required this.items});

  final int percent;
  final List<CompletionCheckItem> items;
}

/// Pure `Resume -> CompletionScoreResult` scorer for the "CV Strength"
/// indicator surfaced on My CVs cards and inside the editor.
abstract final class CompletionScoreService {
  static CompletionScoreResult score(Resume resume) {
    final items = <CompletionCheckItem>[
      CompletionCheckItem(
        label: 'Contact information',
        passed: resume.personalInfo.fullName.trim().isNotEmpty &&
            resume.personalInfo.email.trim().isNotEmpty,
        isRecommendation: false,
      ),
      CompletionCheckItem(
        label: 'Professional summary',
        passed: resume.summary.trim().length > 20,
        isRecommendation: false,
      ),
      CompletionCheckItem(
        label: 'Work experience',
        passed: resume.experiences.isNotEmpty,
        isRecommendation: false,
      ),
      CompletionCheckItem(
        label: 'Education',
        passed: resume.education.isNotEmpty,
        isRecommendation: false,
      ),
      CompletionCheckItem(
        label: 'Skills',
        passed: resume.skills.length >= 3,
        isRecommendation: false,
      ),
      CompletionCheckItem(
        label: 'Add at least one project',
        passed: resume.projects.isNotEmpty,
        isRecommendation: true,
      ),
      CompletionCheckItem(
        label: 'Add LinkedIn profile',
        passed: resume.personalInfo.linkedIn.trim().isNotEmpty,
        isRecommendation: true,
      ),
      CompletionCheckItem(
        label: 'Add a phone number',
        passed: resume.personalInfo.phone.trim().isNotEmpty,
        isRecommendation: true,
      ),
    ];

    final passedCount = items.where((i) => i.passed).length;
    final percent = ((passedCount / items.length) * 100).round();

    return CompletionScoreResult(percent: percent, items: items);
  }
}
