import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../data/models/resume.dart';
import '../shared/pdf_section_widgets.dart';
import '../shared/pdf_theme.dart';
import '../shared/resume_section_content.dart';

/// 04 — Executive: a refined, centered header and generously letter-spaced,
/// centered section headings with a double rule give this a premium,
/// senior-level register distinct from Classic's plainness and Modern's
/// bold color-block structure.
abstract final class ExecutiveTemplate {
  static pw.Page buildPage(Resume resume, ResumePdfTheme theme) {
    return pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(50, 46, 50, 46),
      build: (context) => [
        _header(resume, theme),
        pw.SizedBox(height: 18),
        for (final key in resume.sectionOrder)
          _renderSection(resume, key, theme),
      ],
    );
  }

  static pw.Widget _header(Resume resume, ResumePdfTheme theme) {
    final info = resume.personalInfo;
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Text(
          (info.fullName.trim().isEmpty ? resume.name : info.fullName).toUpperCase(),
          style: theme.nameStyle.copyWith(letterSpacing: 2.2),
          textAlign: pw.TextAlign.center,
        ),
        if (info.professionalTitle.trim().isNotEmpty) ...[
          pw.SizedBox(height: 5),
          pw.Text(
            info.professionalTitle,
            style: theme.titleStyle.copyWith(font: theme.fonts.italic ?? theme.fonts.medium),
            textAlign: pw.TextAlign.center,
          ),
        ],
        pw.SizedBox(height: 8),
        pw.Center(child: PdfSectionWidgets.contactRow(info, theme)),
        pw.SizedBox(height: 12),
        pw.Row(
          children: [
            pw.Expanded(child: pw.Container(height: 0.9, color: theme.divider)),
            pw.Container(
              margin: const pw.EdgeInsets.symmetric(horizontal: 8),
              width: 4,
              height: 4,
              decoration: pw.BoxDecoration(color: theme.accent, shape: pw.BoxShape.circle),
            ),
            pw.Expanded(child: pw.Container(height: 0.9, color: theme.divider)),
          ],
        ),
      ],
    );
  }

  static pw.Widget _renderSection(Resume resume, String key, ResumePdfTheme theme) {
    final content = ResumeSectionContent.contentFor(resume, key, theme);
    if (content == null) return pw.SizedBox();
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 16),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _centeredHeading(ResumeSectionContent.titleFor(resume, key), theme),
          content,
        ],
      ),
    );
  }

  static pw.Widget _centeredHeading(String title, ResumePdfTheme theme) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 9),
      child: pw.Center(
        child: pw.Text(
          title.toUpperCase(),
          style: theme.sectionHeadingStyle.copyWith(letterSpacing: 2.4, color: theme.accent),
        ),
      ),
    );
  }
}
