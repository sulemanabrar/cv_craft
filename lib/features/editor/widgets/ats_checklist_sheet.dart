import 'package:flutter/material.dart';

import '../../../core/design/app_colors.dart';
import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_bottom_sheet.dart';
import '../../../core/design/widgets/primary_button.dart';
import '../../../data/models/resume.dart';
import '../../../data/services/ats_score_service.dart';

/// Shown before export — the spec's "ATS Check" checklist + score, so users
/// know how machine-readable their resume is before they send it out.
Future<void> showAtsChecklistSheet({
  required BuildContext context,
  required Resume resume,
  required VoidCallback onContinueExport,
}) {
  final result = AtsScoreService.score(resume);
  return showAppBottomSheet<void>(
    context: context,
    title: 'ATS Check',
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${result.score}',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: result.score >= 80 ? AppColors.success : AppColors.warning,
                  ),
            ),
            Text(' / 100', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        for (final check in result.checks)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              children: [
                Icon(
                  check.passed ? Icons.check_circle_rounded : Icons.warning_amber_rounded,
                  size: 18,
                  color: check.passed ? AppColors.success : AppColors.warning,
                ),
                const SizedBox(width: AppSpacing.xs),
                Expanded(child: Text(check.label)),
              ],
            ),
          ),
        const SizedBox(height: AppSpacing.sm),
        PrimaryButton(
          label: 'Continue to Export',
          expand: true,
          onPressed: () {
            Navigator.of(context).pop();
            onContinueExport();
          },
        ),
      ],
    ),
  );
}
