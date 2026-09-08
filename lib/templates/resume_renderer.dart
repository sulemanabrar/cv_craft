import 'package:pdf/widgets.dart' as pw;

import '../data/models/resume.dart';
import 'ats_classic/ats_classic_template.dart';
import 'executive/executive_template.dart';
import 'modern/modern_template.dart';
import 'shared/pdf_theme.dart';

/// The single entry point every screen uses to turn a [Resume] into a
/// `pw.Document` — the in-app live preview (`PdfPreview`), the Templates
/// gallery thumbnails, and the final export/share/print flow all call this
/// same function, which is what structurally guarantees the preview can
/// never drift from the exported PDF.
abstract final class ResumeRenderer {
  static Future<pw.Document> build(Resume resume) async {
    final theme = await ResumePdfTheme.resolve(resume.styling);
    final doc = pw.Document();
    doc.addPage(_pageFor(resume, theme));
    return doc;
  }

  static pw.Page _pageFor(Resume resume, ResumePdfTheme theme) {
    switch (resume.styling.templateId) {
      case 'modern':
        return ModernTemplate.buildPage(resume, theme);
      case 'executive':
        return ExecutiveTemplate.buildPage(resume, theme);
      case 'ats_classic':
      default:
        return AtsClassicTemplate.buildPage(resume, theme);
    }
  }
}
