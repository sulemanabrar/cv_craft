import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../data/models/resume.dart';
import '../shared/pdf_theme.dart';
import '../shared/resume_section_content.dart';

/// 03 — Modern: a bold full-width color header band and accent-bar section
/// headings give this a distinctly different structure from ATS Classic's
/// plain stacked header, while remaining a single, linearly-readable column.
abstract final class ModernTemplate {
  static pw.Page buildPage(Resume resume, ResumePdfTheme theme) {
    return pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(0, 0, 0, 36),
      header: (context) => context.pageNumber == 1
          ? pw.SizedBox()
          : pw.Padding(
              padding: const pw.EdgeInsets.fromLTRB(40, 24, 40, 0),
              child: pw.Text(
                (resume.personalInfo.fullName.trim().isEmpty
                        ? resume.name
                        : resume.personalInfo.fullName)
                    .toUpperCase(),
                style: theme.metaStyle,
              ),
            ),
      build: (context) => [
        _headerBand(resume, theme),
        pw.Padding(
          padding: const pw.EdgeInsets.fromLTRB(40, 18, 40, 0),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              for (final key in resume.sectionOrder)
                _renderSection(resume, key, theme),
            ],
          ),
        ),
      ],
    );
  }

  static pw.Widget _headerBand(Resume resume, ResumePdfTheme theme) {
    final info = resume.personalInfo;
    final onAccent = pw.TextStyle(font: theme.fonts.bold, fontSize: theme.nameSize, color: PdfColors.white);
    final onAccentTitle = pw.TextStyle(font: theme.fonts.medium, fontSize: theme.titleSize, color: PdfColors.white);
    final onAccentMeta = pw.TextStyle(font: theme.fonts.regular, fontSize: theme.metaSize, color: PdfColors.white);

    final contactParts = [
      info.location,
      info.phone,
      info.email,
      info.linkedIn,
      info.portfolio,
      info.github,
      info.website,
    ].where((p) => p.trim().isNotEmpty).toList();

    return pw.Container(
      width: double.infinity,
      color: theme.accent,
      padding: const pw.EdgeInsets.fromLTRB(40, 34, 40, 22),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(info.fullName.trim().isEmpty ? resume.name : info.fullName, style: onAccent),
          if (info.professionalTitle.trim().isNotEmpty) ...[
            pw.SizedBox(height: 4),
            pw.Text(info.professionalTitle, style: onAccentTitle),
          ],
          if (contactParts.isNotEmpty) ...[
            pw.SizedBox(height: 8),
            pw.Text(contactParts.join('   |   '), style: onAccentMeta),
          ],
        ],
      ),
    );
  }

  static pw.Widget _renderSection(Resume resume, String key, ResumePdfTheme theme) {
    final content = ResumeSectionContent.contentFor(resume, key, theme);
    if (content == null) return pw.SizedBox();
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 15),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _accentHeading(ResumeSectionContent.titleFor(resume, key), theme),
          content,
        ],
      ),
    );
  }

  static pw.Widget _accentHeading(String title, ResumePdfTheme theme) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 8),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Container(width: 3.4, height: theme.sectionHeadingSize + 2, color: theme.accent),
          pw.SizedBox(width: 8),
          pw.Text(title.toUpperCase(), style: theme.sectionHeadingStyle),
        ],
      ),
    );
  }
}
