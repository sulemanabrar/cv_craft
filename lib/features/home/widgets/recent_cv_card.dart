import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/design/app_spacing.dart';
import '../../../data/models/resume.dart';
import '../../../templates/shared/resume_thumbnail.dart';

class RecentCvCard extends StatelessWidget {
  const RecentCvCard({super.key, required this.resume, required this.onTap});

  final Resume resume;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 148,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ResumeThumbnail(resume: resume, borderRadius: 0),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resume.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      DateFormat('MMM d').format(resume.updatedAt),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
