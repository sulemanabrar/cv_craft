import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/saving_state.dart';
import '../../core/utils/debouncer.dart';
import '../../data/models/resume.dart';
import '../providers.dart';
import '../resume_list/resume_list_provider.dart';
import 'resume_editor_provider.dart';

/// Debounces writes to Hive (~500ms after the last edit) independently from
/// live-preview regeneration, so a slow preview render can never delay
/// saving. Exposes [SavingState] for the editor's "Saving… / All changes
/// saved" indicator.
class AutosaveController extends Notifier<SavingState> {
  AutosaveController(this.resumeId);

  final String resumeId;
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 500));

  @override
  SavingState build() {
    ref.onDispose(_debouncer.dispose);

    ref.listen<Resume>(resumeEditorProvider(resumeId), (previous, next) {
      if (previous == null || previous == next) return;
      state = SavingState.saving;
      _debouncer.run(() => _save(next));
    });

    return SavingState.idle;
  }

  Future<void> _save(Resume resume) async {
    try {
      final repo = ref.read(resumeRepositoryProvider);
      await repo.save(resume);
      ref.read(resumeListProvider.notifier).applySaved(resume);
      state = SavingState.saved;
    } catch (_) {
      state = SavingState.error;
    }
  }

  /// Bypasses the debounce and saves immediately — used when the user
  /// navigates away from the editor so a pending edit is never lost.
  Future<void> saveNow() async {
    _debouncer.dispose();
    await _save(ref.read(resumeEditorProvider(resumeId)));
  }
}

final autosaveProvider =
    NotifierProvider.family<AutosaveController, SavingState, String>(
  AutosaveController.new,
);
