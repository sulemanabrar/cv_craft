import 'package:pdf/widgets.dart' as pw;

import '../../core/utils/date_format_utils.dart';
import '../../data/models/personal_info.dart';
import 'pdf_theme.dart';

/// Shared, atomic `pw.Widget` builders every template composes its page
/// layout from. Templates should differ in *composition* of these pieces,
/// not reinvent them — this is what keeps 10 templates from becoming 10
/// divergent implementations of "a heading" or "a bullet list".
abstract final class PdfSectionWidgets {
  /// Splits a free-text multi-line description into bullet points. Each
  /// non-empty line becomes one bullet; leading "-"/"•" markers are stripped
  /// since the bullet glyph is rendered by [bulletList] itself.
  static List<String> splitBullets(String description) {
    return description
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .map((line) => line.replaceFirst(RegExp(r'^[-•*]\s*'), ''))
        .toList();
  }

  static pw.Widget sectionHeading(
    String title,
    ResumePdfTheme theme, {
    bool withRule = true,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(title.toUpperCase(), style: theme.sectionHeadingStyle),
        if (withRule) ...[
          pw.SizedBox(height: 3),
          pw.Container(height: 1.1, color: theme.accent),
        ],
        pw.SizedBox(height: 8),
      ],
    );
  }

  static pw.Widget bulletList(List<String> bullets, ResumePdfTheme theme) {
    if (bullets.isEmpty) return pw.SizedBox();
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        for (final bullet in bullets)
          pw.Padding(
            padding: pw.EdgeInsets.only(bottom: theme.bodyLineSpacing),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  margin: const pw.EdgeInsets.only(top: 4, right: 6),
                  width: 3,
                  height: 3,
                  decoration: pw.BoxDecoration(
                    color: theme.inkSecondary,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Expanded(
                  child: pw.Text(bullet, style: theme.bodyStyle),
                ),
              ],
            ),
          ),
      ],
    );
  }

  static String dateRange({
    required DateTime? start,
    required DateTime? end,
    required bool isCurrent,
  }) =>
      DateFormatUtils.dateRange(start: start, end: end, isCurrent: isCurrent);

  /// A single-line, pipe-separated contact row — deliberately plain text
  /// (not icon-only) so it stays fully ATS-readable.
  static pw.Widget contactRow(PersonalInfo info, ResumePdfTheme theme) {
    final parts = [
      info.location,
      info.phone,
      info.email,
      info.linkedIn,
      info.portfolio,
      info.github,
      info.website,
    ].where((p) => p.trim().isNotEmpty).toList();

    if (parts.isEmpty) return pw.SizedBox();

    return pw.Text(parts.join('   |   '), style: theme.metaStyle);
  }

  static pw.Widget itemHeader({
    required String title,
    required String subtitle,
    required String dateText,
    required ResumePdfTheme theme,
  }) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(title, style: theme.itemTitleStyle),
              if (subtitle.trim().isNotEmpty)
                pw.Text(subtitle, style: theme.itemSubtitleStyle),
            ],
          ),
        ),
        if (dateText.trim().isNotEmpty)
          pw.Text(dateText, style: theme.metaStyle),
      ],
    );
  }
}
