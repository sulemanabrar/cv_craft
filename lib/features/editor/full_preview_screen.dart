import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import '../../core/design/app_spacing.dart';
import '../../data/services/pdf_export_service.dart';
import '../../state/resume_editor/debounced_preview_provider.dart';
import '../../state/resume_editor/resume_editor_provider.dart';
import '../../templates/resume_renderer.dart';
import '../../templates/template_registry.dart';
import 'widgets/ats_checklist_sheet.dart';

/// A full-screen live preview of the resume, backed by the exact same
/// [ResumeRenderer] the export flow uses — this is what structurally
/// guarantees the preview can never look different from the exported PDF.
class FullPreviewScreen extends ConsumerWidget {
  const FullPreviewScreen({super.key, required this.resumeId});

  final String resumeId;

  void _exportPdf(BuildContext context, WidgetRef ref) {
    final resume = ref.read(resumeEditorProvider(resumeId));
    showAtsChecklistSheet(
      context: context,
      resume: resume,
      onContinueExport: () => PdfExportService.print(resume),
    );
  }

  void _sharePdf(WidgetRef ref) {
    final resume = ref.read(resumeEditorProvider(resumeId));
    PdfExportService.share(resume);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previewResume = ref.watch(debouncedResumeForPreviewProvider(resumeId));
    final template = TemplateRegistry.byId(previewResume.styling.templateId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Preview · ${template.name}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Share PDF',
            onPressed: () => _sharePdf(ref),
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: FilledButton.icon(
              onPressed: () => _exportPdf(context, ref),
              icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
              label: const Text('Export'),
            ),
          ),
        ],
      ),
      body: PdfPreview(
        key: ValueKey(previewResume),
        build: (format) async {
          final doc = await ResumeRenderer.build(previewResume);
          return doc.save();
        },
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        allowPrinting: false,
        allowSharing: false,
        useActions: false,
      ),
    );
  }
}
