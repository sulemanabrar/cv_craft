import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/section_types.dart';
import '../../core/design/app_spacing.dart';
import '../../core/design/widgets/app_bottom_sheet.dart';
import '../../core/design/widgets/app_dialog.dart';
import '../../core/design/widgets/app_toggle_row.dart';
import '../../state/resume_editor/resume_editor_provider.dart';

Future<void> showSectionVisibilitySheet({
  required BuildContext context,
  required String resumeId,
}) {
  return showAppBottomSheet<void>(
    context: context,
    title: 'Manage Sections',
    builder: (context) => _SectionVisibilityBody(resumeId: resumeId),
  );
}

class _SectionVisibilityBody extends ConsumerWidget {
  const _SectionVisibilityBody({required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.watch(resumeEditorProvider(resumeId));
    final notifier = ref.read(resumeEditorProvider(resumeId).notifier);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Turn on the additional sections that apply to you.',
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final type in optionalSectionTypes)
          AppToggleRow(
            label: type.label,
            value: resume.enabledOptionalSections.contains(type.key),
            onChanged: (enabled) => notifier.setOptionalSectionEnabled(type, enabled),
          ),
        const Divider(height: AppSpacing.lg),
        Text('Custom Sections', style: theme.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.xs),
        for (final section in resume.customSections)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(section.title),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () => notifier.removeCustomSection(section.id),
            ),
          ),
        OutlinedButton.icon(
          onPressed: () async {
            final title = await showTextInputDialog(
              context: context,
              title: 'New Custom Section',
              hintText: 'e.g. Publications, Patents',
              confirmLabel: 'Add',
            );
            if (title != null) notifier.addCustomSection(title);
          },
          icon: const Icon(Icons.add_rounded, size: 18),
          label: const Text('Add Custom Section'),
        ),
      ],
    );
  }
}
