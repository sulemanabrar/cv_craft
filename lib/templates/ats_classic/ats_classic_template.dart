import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../data/models/resume.dart';
import '../shared/pdf_section_widgets.dart';
import '../shared/pdf_theme.dart';
import '../shared/resume_section_content.dart';

/// 01 — ATS Classic: an extremely clean single-column layout with no
/// decoration beyond a thin accent rule under each heading. This is the
/// reference implementation every other template's shared primitives are
/// validated against.
abstract final class AtsClassicTemplate {
  static pw.Page buildPage(Resume resume, ResumePdfTheme theme) {
    return pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(46, 42, 46, 42),
      build: (context) => [
        _header(resume, theme),
        pw.SizedBox(height: 16),
        for (final key in resume.sectionOrder)
          _renderSection(resume, key, theme),
      ],
    );
  }

  static pw.Widget _header(Resume resume, ResumePdfTheme theme) {
    final info = resume.personalInfo;
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          info.fullName.trim().isEmpty ? resume.name : info.fullName,
          style: theme.nameStyle,
        ),
        if (info.professionalTitle.trim().isNotEmpty) ...[
          pw.SizedBox(height: 3),
          pw.Text(info.professionalTitle, style: theme.titleStyle),
        ],
        pw.SizedBox(height: 6),
        PdfSectionWidgets.contactRow(info, theme),
        pw.SizedBox(height: 10),
        pw.Container(height: 1.4, color: theme.ink),
      ],
    );
  }

  static pw.Widget _renderSection(Resume resume, String key, ResumePdfTheme theme) {
    final content = ResumeSectionContent.contentFor(resume, key, theme);
    if (content == null) return pw.SizedBox();
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 14),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          PdfSectionWidgets.sectionHeading(
            ResumeSectionContent.titleFor(resume, key),
            theme,
          ),
          content,
        ],
      ),
    );
  }
}
