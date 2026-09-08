import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/debouncer.dart';
import '../../data/models/resume.dart';
import 'resume_editor_provider.dart';

/// A debounced (~400ms) snapshot of the resume being edited, used only to
/// drive the live PDF preview. Kept independent from [AutosaveController]'s
/// own debounce — regenerating a `pw.Document` is comparatively slow, so it
/// must never share a timer with (or block) the save-to-disk path.
class DebouncedResumeController extends Notifier<Resume> {
  DebouncedResumeController(this.resumeId);

  final String resumeId;
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 400));

  @override
  Resume build() {
    ref.onDispose(_debouncer.dispose);

    ref.listen<Resume>(resumeEditorProvider(resumeId), (previous, next) {
      _debouncer.run(() => state = next);
    });

    return ref.read(resumeEditorProvider(resumeId));
  }
}

final debouncedResumeForPreviewProvider =
    NotifierProvider.family<DebouncedResumeController, Resume, String>(
  DebouncedResumeController.new,
);
