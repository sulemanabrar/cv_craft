import 'package:flutter/material.dart';

import '../../../core/design/app_colors.dart';
import '../../../core/design/app_spacing.dart';
import '../../../data/models/resume.dart';
import '../../../data/services/completion_score_service.dart';

/// The "CV Strength NN%" indicator — surfaced in the editor's app bar. Tap
/// to see the full checklist of what's missing.
class CvCompletionBadge extends StatelessWidget {
  const CvCompletionBadge({super.key, required this.resume, required this.onTap});

  final Resume resume;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final result = CompletionScoreService.score(resume);
    final color = result.percent >= 80
        ? AppColors.success
        : result.percent >= 50
            ? AppColors.warning
            : AppColors.danger;

    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.pill),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                value: result.percent / 100,
                strokeWidth: 2.2,
                color: color,
                backgroundColor: color.withValues(alpha: 0.2),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '${result.percent}%',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showCvStrengthSheet(BuildContext context, Resume resume) {
  final result = CompletionScoreService.score(resume);
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('CV Strength: ${result.percent}%'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in result.items)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      item.passed
                          ? Icons.check_circle_rounded
                          : (item.isRecommendation
                              ? Icons.info_outline_rounded
                              : Icons.circle_outlined),
                      size: 18,
                      color: item.passed ? AppColors.success : AppColors.warning,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(child: Text(item.label)),
                  ],
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close')),
      ],
    ),
  );
}
