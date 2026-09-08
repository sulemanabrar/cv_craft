import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_paths.dart';
import '../../core/design/app_spacing.dart';
import '../../core/design/widgets/app_dialog.dart';
import '../../core/design/widgets/confirmation_dialog.dart';
import '../../core/design/widgets/empty_state.dart';
import '../../core/design/widgets/skeleton_loader.dart';
import '../../data/services/pdf_export_service.dart';
import '../../state/resume_list/resume_list_provider.dart';
import 'widgets/resume_card.dart';

class MyCvsScreen extends ConsumerWidget {
  const MyCvsScreen({super.key});

  Future<void> _handleAction(
    BuildContext context,
    WidgetRef ref,
    String resumeId,
    ResumeCardAction action,
  ) async {
    final notifier = ref.read(resumeListProvider.notifier);
    final resumes = ref.read(resumeListProvider).value ?? const [];
    final resume = resumes.where((r) => r.id == resumeId).firstOrNull;
    if (resume == null) return;

    switch (action) {
      case ResumeCardAction.edit:
        if (context.mounted) context.push(RoutePaths.editorPath(resumeId));
        break;
      case ResumeCardAction.rename:
        final name = await showTextInputDialog(
          context: context,
          title: 'Rename CV',
          initialValue: resume.name,
          confirmLabel: 'Rename',
        );
        if (name != null) await notifier.renameResume(resumeId, name);
        break;
      case ResumeCardAction.duplicate:
        await notifier.duplicateResume(resumeId);
        break;
      case ResumeCardAction.exportPdf:
        await PdfExportService.print(resume);
        break;
      case ResumeCardAction.share:
        await PdfExportService.share(resume);
        break;
      case ResumeCardAction.delete:
        final confirmed = await showConfirmationDialog(
          context: context,
          title: 'Delete this CV?',
          message: 'This will permanently delete "${resume.name}". This can\'t be undone.',
        );
        if (confirmed) await notifier.deleteResume(resumeId);
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumesAsync = ref.watch(resumeListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My CVs')),
      body: SafeArea(
        child: resumesAsync.when(
          loading: () => ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: const [
              SkeletonLoader(height: 84),
              SizedBox(height: AppSpacing.sm),
              SkeletonLoader(height: 84),
              SizedBox(height: AppSpacing.sm),
              SkeletonLoader(height: 84),
            ],
          ),
          error: (_, _) => EmptyState(
            icon: Icons.error_outline_rounded,
            title: "Couldn't load your CVs",
            message: 'Please try again.',
            actionLabel: 'Retry',
            onAction: () => ref.invalidate(resumeListProvider),
          ),
          data: (resumes) {
            if (resumes.isEmpty) {
              return EmptyState(
                icon: Icons.description_outlined,
                title: 'No CVs yet',
                message: 'Create your first resume to get started.',
                actionLabel: 'Create New CV',
                onAction: () => context.push(RoutePaths.createFlow),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: resumes.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final resume = resumes[index];
                return ResumeCard(
                  resume: resume,
                  onTap: () => context.push(RoutePaths.editorPath(resume.id)),
                  onAction: (action) => _handleAction(context, ref, resume.id, action),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(RoutePaths.createFlow),
        icon: const Icon(Icons.add_rounded),
        label: const Text('New CV'),
      ),
    );
  }
}
