import 'package:printing/printing.dart';

import '../../templates/resume_renderer.dart';
import '../models/resume.dart';

/// Every export path (share, print, "save") goes through the same
/// [ResumeRenderer] the live preview uses — there is no separate
/// export-time rendering logic to drift out of sync with what the user saw.
abstract final class PdfExportService {
  static String _fileName(Resume resume) {
    final safe = resume.name.trim().replaceAll(RegExp(r'[^A-Za-z0-9 _-]'), '');
    return safe.isEmpty ? 'Resume' : safe;
  }

  /// Opens the native print dialog / preview — on many platforms this also
  /// offers "Save as PDF".
  static Future<void> print(Resume resume) async {
    final doc = await ResumeRenderer.build(resume);
    await Printing.layoutPdf(
      onLayout: (format) => doc.save(),
      name: _fileName(resume),
    );
  }

  /// Opens the native share sheet with the generated PDF attached.
  static Future<void> share(Resume resume) async {
    final doc = await ResumeRenderer.build(resume);
    final bytes = await doc.save();
    await Printing.sharePdf(bytes: bytes, filename: '${_fileName(resume)}.pdf');
  }
}
