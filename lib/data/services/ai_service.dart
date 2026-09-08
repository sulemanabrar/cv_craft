/// Pluggable AI writing-assistant interface. Phase 1 ships [MockAIService];
/// a real implementation can be swapped in later without touching any UI,
/// since callers only ever depend on this abstraction.
///
/// Suggestions must never auto-apply — every call site shows the result in a
/// sheet with "Use Suggestion" / "Keep My Version".
abstract class AIService {
  Future<String> improveSummary(String currentSummary);

  Future<String> improveBullet(String currentBullet);

  Future<List<String>> generateBullets({
    required String jobTitle,
    required String company,
  });

  Future<JobMatchResult> matchJobDescription({
    required String resumeSummary,
    required List<String> resumeSkills,
    required String jobDescription,
  });
}

class JobMatchResult {
  const JobMatchResult({
    required this.matchScore,
    required this.matchedKeywords,
    required this.missingKeywords,
  });

  final int matchScore;
  final List<String> matchedKeywords;
  final List<String> missingKeywords;
}
