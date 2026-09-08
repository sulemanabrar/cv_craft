import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_badge.dart';
import '../../../data/models/resume.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../../../templates/shared/resume_thumbnail.dart';
import '../../../templates/template_registry.dart';
import '../../../core/design/widgets/app_bottom_sheet.dart';

/// Lets the user switch templates using their *actual* resume content — not
/// a sample — so they see exactly how their real CV would look. Switching
/// only ever changes `styling.templateId`; content is never touched.
Future<void> showTemplateSwitchSheet({
  required BuildContext context,
  required String resumeId,
}) {
  return showAppBottomSheet<void>(
    context: context,
    title: 'Switch Template',
    builder: (context) => _TemplateSwitchBody(resumeId: resumeId),
  );
}

class _TemplateSwitchBody extends ConsumerWidget {
  const _TemplateSwitchBody({required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.watch(resumeEditorProvider(resumeId));

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
        childAspectRatio: 0.62,
      ),
      itemCount: TemplateRegistry.all.length,
      itemBuilder: (context, index) {
        final template = TemplateRegistry.all[index];
        final selected = resume.styling.templateId == template.id;
        final previewResume = resume.copyWith(
          styling: resume.styling.copyWith(templateId: template.id),
        );
        return _TemplateOption(
          resume: previewResume,
          name: template.name,
          isAtsFriendly: template.isAtsFriendly,
          selected: selected,
          onTap: () {
            ref.read(resumeEditorProvider(resumeId).notifier).setTemplate(template.id);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}

class _TemplateOption extends StatelessWidget {
  const _TemplateOption({
    required this.resume,
    required this.name,
    required this.isAtsFriendly,
    required this.selected,
    required this.onTap,
  });

  final Resume resume;
  final String name;
  final bool isAtsFriendly;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? theme.colorScheme.primary : theme.dividerColor,
            width: selected ? 2 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: ResumeThumbnail(resume: resume, borderRadius: 0)),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xs),
              child: Row(
                children: [
                  Expanded(
                    child: Text(name, style: theme.textTheme.labelLarge, overflow: TextOverflow.ellipsis),
                  ),
                  if (isAtsFriendly) const AppBadge.atsFriendly(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
