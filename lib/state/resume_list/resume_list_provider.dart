import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/id_generator.dart';
import '../../data/models/resume.dart';
import '../../data/models/resume_factory.dart';
import '../providers.dart';

/// Backs Home's "recent CVs" and the My CVs screen. Holds the full list of
/// saved resumes, sorted most-recently-edited first, and exposes the
/// create/duplicate/rename/delete actions every list-level screen needs.
class ResumeListNotifier extends AsyncNotifier<List<Resume>> {
  @override
  Future<List<Resume>> build() => _fetch();

  Future<List<Resume>> _fetch() async {
    final repo = ref.read(resumeRepositoryProvider);
    final resumes = await repo.getAll();
    resumes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return resumes;
  }

  Future<void> _refresh() async {
    state = await AsyncValue.guard(_fetch);
  }

  Future<Resume> createResume({
    required String name,
    required String templateId,
  }) async {
    final repo = ref.read(resumeRepositoryProvider);
    final resume = createBlankResume(name: name, templateId: templateId);
    await repo.save(resume);
    await _refresh();
    return resume;
  }

  Future<Resume> duplicateResume(String id) async {
    final repo = ref.read(resumeRepositoryProvider);
    final resumes = state.value ?? const <Resume>[];
    final original = resumes.firstWhere((r) => r.id == id);
    final now = DateTime.now();
    final copy = original.copyWith(
      id: generateId(),
      name: '${original.name} (Copy)',
      createdAt: now,
      updatedAt: now,
    );
    await repo.save(copy);
    await _refresh();
    return copy;
  }

  Future<void> renameResume(String id, String newName) async {
    final repo = ref.read(resumeRepositoryProvider);
    final resumes = state.value ?? const <Resume>[];
    final resume = resumes.firstWhere((r) => r.id == id);
    await repo.save(resume.copyWith(name: newName, updatedAt: DateTime.now()));
    await _refresh();
  }

  Future<void> deleteResume(String id) async {
    final repo = ref.read(resumeRepositoryProvider);
    await repo.delete(id);
    await _refresh();
  }

  /// Called by the autosave path after it persists an in-progress edit, so
  /// the list screens reflect the new `updatedAt`/content without a full
  /// disk re-read.
  void applySaved(Resume resume) {
    final resumes = List<Resume>.from(state.value ?? const <Resume>[]);
    final index = resumes.indexWhere((r) => r.id == resume.id);
    if (index == -1) {
      resumes.insert(0, resume);
    } else {
      resumes[index] = resume;
    }
    resumes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    state = AsyncData(resumes);
  }
}

final resumeListProvider =
    AsyncNotifierProvider<ResumeListNotifier, List<Resume>>(
  ResumeListNotifier.new,
);
