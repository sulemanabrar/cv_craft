import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/design/app_spacing.dart';
import '../../../data/models/resume.dart';
import '../../../data/services/completion_score_service.dart';
import '../../../templates/shared/resume_thumbnail.dart';
import '../../../templates/template_registry.dart';

enum ResumeCardAction { edit, rename, duplicate, exportPdf, share, delete }

class ResumeCard extends StatelessWidget {
  const ResumeCard({
    super.key,
    required this.resume,
    required this.onTap,
    required this.onAction,
  });

  final Resume resume;
  final VoidCallback onTap;
  final ValueChanged<ResumeCardAction> onAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final template = TemplateRegistry.byId(resume.styling.templateId);
    final strength = CompletionScoreService.score(resume).percent;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 64,
                height: 64 * 297 / 210,
                child: ResumeThumbnail(resume: resume),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resume.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${template.name} · Edited ${DateFormat('MMM d').format(resume.updatedAt)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: strength / 100,
                              minHeight: 4,
                              backgroundColor: theme.colorScheme.surfaceContainerHighest,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text('$strength%', style: theme.textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              ),
              PopupMenuButton<ResumeCardAction>(
                icon: const Icon(Icons.more_vert_rounded),
                onSelected: onAction,
                itemBuilder: (context) => const [
                  PopupMenuItem(value: ResumeCardAction.edit, child: Text('Edit')),
                  PopupMenuItem(value: ResumeCardAction.rename, child: Text('Rename')),
                  PopupMenuItem(value: ResumeCardAction.duplicate, child: Text('Duplicate')),
                  PopupMenuItem(value: ResumeCardAction.exportPdf, child: Text('Export PDF')),
                  PopupMenuItem(value: ResumeCardAction.share, child: Text('Share')),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    value: ResumeCardAction.delete,
                    child: Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
