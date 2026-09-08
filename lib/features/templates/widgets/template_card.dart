import 'package:flutter/material.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_badge.dart';
import '../../../data/fixtures/sample_resume_fixture.dart';
import '../../../templates/shared/resume_thumbnail.dart';
import '../../../templates/template_registry.dart';

class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key, required this.template, required this.onTap});

  final TemplateDefinition template;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ResumeThumbnail(
                resume: buildSampleResume(templateId: template.id),
                borderRadius: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(template.name, style: theme.textTheme.titleSmall),
                      ),
                      if (template.isAtsFriendly) const AppBadge.atsFriendly(),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    template.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
    );
  }
}
