import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../data/models/resume.dart';
import '../resume_renderer.dart';

/// In-memory cache of rasterized page-1 thumbnails, keyed by resume id +
/// updatedAt + template + color — so list screens (My CVs, Home recents,
/// Templates gallery) never spin up a live `PdfPreview` per card; each
/// thumbnail is rendered once and reused until the resume actually changes.
abstract final class ResumeThumbnailCache {
  static final Map<String, Uint8List> _cache = {};

  static Uint8List? get(String key) => _cache[key];

  static void put(String key, Uint8List bytes) {
    _cache[key] = bytes;
  }
}

String _thumbnailKey(Resume resume) =>
    '${resume.id}-${resume.updatedAt.millisecondsSinceEpoch}-'
    '${resume.styling.templateId}-${resume.styling.colorPresetId}-'
    '${resume.styling.fontFamily}';

/// Renders (and caches) a realistic first-page thumbnail of [resume] using
/// the exact same [ResumeRenderer] the full preview and PDF export use —
/// so list-screen previews never drift from what actually gets exported.
class ResumeThumbnail extends StatefulWidget {
  const ResumeThumbnail({super.key, required this.resume, this.borderRadius = 8});

  final Resume resume;
  final double borderRadius;

  @override
  State<ResumeThumbnail> createState() => _ResumeThumbnailState();
}

class _ResumeThumbnailState extends State<ResumeThumbnail> {
  Uint8List? _bytes;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant ResumeThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_thumbnailKey(oldWidget.resume) != _thumbnailKey(widget.resume)) {
      _bytes = null;
      _failed = false;
      _load();
    }
  }

  Future<void> _load() async {
    final key = _thumbnailKey(widget.resume);
    final cached = ResumeThumbnailCache.get(key);
    if (cached != null) {
      if (mounted) setState(() => _bytes = cached);
      return;
    }
    try {
      final doc = await ResumeRenderer.build(widget.resume);
      final pdfBytes = await doc.save();
      final page = await Printing.raster(pdfBytes, pages: const [0], dpi: 110).first;
      final png = await page.toPng();
      ResumeThumbnailCache.put(key, png);
      if (mounted) setState(() => _bytes = png);
    } catch (_) {
      if (mounted) setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(widget.borderRadius);
    if (_bytes != null) {
      return ClipRRect(
        borderRadius: radius,
        child: Image.memory(_bytes!, fit: BoxFit.cover, alignment: Alignment.topCenter),
      );
    }
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: radius,
      ),
      child: Center(
        child: _failed
            ? Icon(Icons.description_outlined, color: theme.colorScheme.onSurfaceVariant)
            : SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: theme.colorScheme.primary),
              ),
      ),
    );
  }
}
