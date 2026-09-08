import 'dart:math';

import 'ai_service.dart';

/// Local, offline mock of [AIService]. Produces plausible-looking rewrites
/// after a simulated delay so the real UI/UX (loading state, suggestion
/// sheet, Use/Keep flow) can be fully built and tested before a real
/// network-backed implementation is wired in.
class MockAIService implements AIService {
  final Random _random = Random();

  Future<void> _simulateLatency() =>
      Future.delayed(const Duration(milliseconds: 900));

  @override
  Future<String> improveSummary(String currentSummary) async {
    await _simulateLatency();
    final trimmed = currentSummary.trim();
    if (trimmed.isEmpty) {
      return 'Results-driven professional with a track record of delivering '
          'high-quality work across cross-functional teams. Skilled at '
          'translating business goals into effective, well-tested solutions '
          'and communicating clearly with stakeholders at every level.';
    }
    // If the text already looks AI-improved (e.g. the user tapped "Improve"
    // more than once), offer a fresh alternate phrasing instead of nesting
    // quoted summaries inside each other.
    if (trimmed.contains('summarized as:')) {
      return 'Accomplished professional with a consistent record of '
          'measurable impact — skilled at aligning cross-functional teams '
          'around clear goals and delivering high-quality outcomes under '
          'deadline pressure.';
    }
    return 'Accomplished professional with proven expertise summarized as: '
        '"$trimmed" — known for driving measurable results, collaborating '
        'effectively across teams, and consistently delivering high-impact '
        'outcomes on time.';
  }

  @override
  Future<String> improveBullet(String currentBullet) async {
    await _simulateLatency();
    final trimmed = currentBullet.trim();
    if (trimmed.isEmpty) {
      return 'Delivered measurable improvements by identifying key '
          'opportunities and executing a clear, results-oriented plan.';
    }
    final starters = [
      'Spearheaded',
      'Drove',
      'Delivered',
      'Led',
      'Optimized',
    ];
    final starter = starters[_random.nextInt(starters.length)];
    final body = trimmed.substring(0, 1).toLowerCase() + trimmed.substring(1);
    return '$starter $body, resulting in measurable improvements to quality '
        'and delivery speed.';
  }

  @override
  Future<List<String>> generateBullets({
    required String jobTitle,
    required String company,
  }) async {
    await _simulateLatency();
    final title = jobTitle.trim().isEmpty ? 'this role' : jobTitle.trim();
    final org = company.trim().isEmpty ? 'the organization' : company.trim();
    return [
      'Owned end-to-end delivery as $title at $org, partnering with '
          'stakeholders to define priorities and ship on schedule.',
      'Improved team processes and tooling, reducing turnaround time and '
          'increasing overall output quality.',
      'Mentored teammates and contributed to a collaborative, '
          'high-performing team culture.',
    ];
  }

  @override
  Future<JobMatchResult> matchJobDescription({
    required String resumeSummary,
    required List<String> resumeSkills,
    required String jobDescription,
  }) async {
    await _simulateLatency();
    final jdWords = jobDescription
        .toLowerCase()
        .split(RegExp(r'[^a-z0-9+.#]+'))
        .where((w) => w.length > 2)
        .toSet();
    final normalizedSkills = resumeSkills.map((s) => s.toLowerCase()).toList();

    final matched = <String>[];
    final missing = <String>[];
    for (final skill in normalizedSkills) {
      if (jdWords.any((w) => w.contains(skill) || skill.contains(w))) {
        matched.add(skill);
      }
    }
    for (final word in jdWords) {
      if (word.length > 4 &&
          !normalizedSkills.any((s) => s.contains(word) || word.contains(s))) {
        missing.add(word);
      }
    }
    missing.shuffle(_random);

    final score = normalizedSkills.isEmpty
        ? 40
        : ((matched.length / normalizedSkills.length) * 100)
            .clamp(20, 98)
            .round();

    return JobMatchResult(
      matchScore: score,
      matchedKeywords: matched.take(8).toList(),
      missingKeywords: missing.take(6).toList(),
    );
  }
}
