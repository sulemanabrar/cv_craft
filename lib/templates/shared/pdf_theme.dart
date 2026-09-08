import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../core/design/app_colors.dart';
import '../../data/models/resume_styling.dart';
import 'pdf_font_cache.dart';

/// Resolves a [ResumeStyling] + [PdfFontSet] into concrete text styles and
/// colors every template composes from. Templates differ in *layout*; they
/// should all pull their type/color values from here so a user's font size,
/// color, and spacing choices apply consistently regardless of template.
class ResumePdfTheme {
  ResumePdfTheme._({
    required this.fonts,
    required this.accent,
    required this.ink,
    required this.inkSecondary,
    required this.divider,
    required double fontSizeScale,
    required double headingSizeScale,
    required this.lineSpacingScale,
  })  : nameSize = 26 * headingSizeScale,
        titleSize = 12.5 * fontSizeScale,
        sectionHeadingSize = 12 * headingSizeScale,
        bodySize = 9.8 * fontSizeScale,
        metaSize = 9 * fontSizeScale;

  final PdfFontSet fonts;
  final PdfColor accent;
  final PdfColor ink;
  final PdfColor inkSecondary;
  final PdfColor divider;
  final double lineSpacingScale;

  final double nameSize;
  final double titleSize;
  final double sectionHeadingSize;
  final double bodySize;
  final double metaSize;

  static PdfColor _resolveAccent(String colorPresetId) {
    final preset = ResumeColorPreset.values.firstWhere(
      (p) => p.name == colorPresetId,
      orElse: () => ResumeColorPreset.navy,
    );
    return PdfColor.fromInt(preset.color.toARGB32());
  }

  static Future<ResumePdfTheme> resolve(ResumeStyling styling) async {
    final fonts = await PdfFontCache.forFamily(styling.fontFamily);
    return ResumePdfTheme._(
      fonts: fonts,
      accent: _resolveAccent(styling.colorPresetId),
      ink: PdfColors.grey900,
      inkSecondary: PdfColors.grey700,
      divider: PdfColors.grey400,
      fontSizeScale: styling.fontSizeScale,
      headingSizeScale: styling.headingSizeScale,
      lineSpacingScale: styling.lineSpacingScale,
    );
  }

  pw.TextStyle get nameStyle =>
      pw.TextStyle(font: fonts.bold, fontSize: nameSize, color: ink);

  pw.TextStyle get titleStyle =>
      pw.TextStyle(font: fonts.medium, fontSize: titleSize, color: accent);

  pw.TextStyle get sectionHeadingStyle => pw.TextStyle(
        font: fonts.semiBold,
        fontSize: sectionHeadingSize,
        color: ink,
        letterSpacing: 0.6,
      );

  pw.TextStyle get itemTitleStyle =>
      pw.TextStyle(font: fonts.semiBold, fontSize: bodySize + 0.6, color: ink);

  pw.TextStyle get itemSubtitleStyle => pw.TextStyle(
        font: fonts.medium,
        fontSize: bodySize,
        color: accent,
      );

  pw.TextStyle get bodyStyle =>
      pw.TextStyle(font: fonts.regular, fontSize: bodySize, color: ink);

  pw.TextStyle get metaStyle =>
      pw.TextStyle(font: fonts.regular, fontSize: metaSize, color: inkSecondary);

  double get bodyLineSpacing => bodySize * 0.42 * lineSpacingScale;
}
