import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:printing/printing.dart';

import '../../core/constants/route_paths.dart';
import '../../core/design/app_spacing.dart';
import '../../core/design/widgets/app_badge.dart';
import '../../core/design/widgets/app_dialog.dart';
import '../../core/design/widgets/primary_button.dart';
import '../../data/fixtures/sample_resume_fixture.dart';
import '../../state/resume_list/resume_list_provider.dart';
import '../../templates/resume_renderer.dart';
import '../../templates/template_registry.dart';

class TemplateDetailScreen extends ConsumerWidget {
  const TemplateDetailScreen({super.key, required this.templateId});

  final String templateId;

  Future<void> _useTemplate(BuildContext context, WidgetRef ref) async {
    final name = await showTextInputDialog(
      context: context,
      title: 'Name your CV',
      hintText: 'e.g. Software Engineer CV',
      confirmLabel: 'Create',
    );
    if (name == null) return;
    final resume = await ref
        .read(resumeListProvider.notifier)
        .createResume(name: name, templateId: templateId);
    if (context.mounted) {
      context.pushReplacement(RoutePaths.editorPath(resume.id));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final template = TemplateRegistry.byId(templateId);
    final sample = buildSampleResume(templateId: templateId);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(template.name)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PdfPreview(
                build: (format) async {
                  final doc = await ResumeRenderer.build(sample);
                  return doc.save();
                },
                allowPrinting: false,
                allowSharing: false,
                canChangeOrientation: false,
                canChangePageFormat: false,
                canDebug: false,
                useActions: false,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.lg),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border(top: BorderSide(color: theme.dividerColor)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(template.name, style: theme.textTheme.titleMedium)),
                      if (template.isAtsFriendly) const AppBadge.atsFriendly(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    template.description,
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  PrimaryButton(
                    label: 'Use This Template',
                    expand: true,
                    onPressed: () => _useTemplate(context, ref),
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
