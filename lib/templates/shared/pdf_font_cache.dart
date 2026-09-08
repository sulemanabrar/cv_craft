import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

import '../../data/models/resume_styling.dart';

/// Loads and caches [pw.Font]s from bundled `.ttf` assets so every template
/// render reuses the same decoded font bytes instead of re-reading/decoding
/// them on every debounced preview regeneration.
///
/// PDF font loading is a separate pipeline from the Flutter-side
/// `google_fonts` package (which only feeds on-screen `Text` widgets) — the
/// PDF renderer needs its own bundled `.ttf` files loaded via `rootBundle`.
class PdfFontSet {
  const PdfFontSet({
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
    this.italic,
  });

  final pw.Font regular;
  final pw.Font medium;
  final pw.Font semiBold;
  final pw.Font bold;
  final pw.Font? italic;
}

abstract final class PdfFontCache {
  static final Map<String, PdfFontSet> _cache = {};

  static Future<pw.Font> _load(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    return pw.Font.ttf(data);
  }

  /// Resolves the [PdfFontSet] for a styling's `fontFamily` id, loading and
  /// caching the underlying `.ttf` bytes on first use.
  static Future<PdfFontSet> forFamily(String fontFamily) async {
    final cached = _cache[fontFamily];
    if (cached != null) return cached;

    late final PdfFontSet set;
    switch (fontFamily) {
      case ResumeFontFamilyIds.ptSerif:
        set = PdfFontSet(
          regular: await _load('assets/fonts/PTSerif-Regular.ttf'),
          medium: await _load('assets/fonts/PTSerif-Bold.ttf'),
          semiBold: await _load('assets/fonts/PTSerif-Bold.ttf'),
          bold: await _load('assets/fonts/PTSerif-Bold.ttf'),
          italic: await _load('assets/fonts/PTSerif-Italic.ttf'),
        );
        break;
      case ResumeFontFamilyIds.firaSans:
      default:
        set = PdfFontSet(
          regular: await _load('assets/fonts/FiraSans-Regular.ttf'),
          medium: await _load('assets/fonts/FiraSans-Medium.ttf'),
          semiBold: await _load('assets/fonts/FiraSans-SemiBold.ttf'),
          bold: await _load('assets/fonts/FiraSans-Bold.ttf'),
          italic: await _load('assets/fonts/FiraSans-Italic.ttf'),
        );
        break;
    }
    _cache[fontFamily] = set;
    return set;
  }
}
